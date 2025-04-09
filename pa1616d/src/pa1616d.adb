with HAL.UART; use HAL.UART;
with HAL; use HAL;

with Ada.Strings.Fixed; use Ada.Strings.Fixed;

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package body PA1616D is

    function read_line (device : in out PA1616D_Device; buffer : in out Unbounded_String) return boolean is
        data : UART_Data_8b(1..1);
    begin
        if not UART.available (device.port.all) then
            return false;
        end if;
        loop
            exit when not UART.read (device.port.all, data, 10);
            Append(buffer, Character'Val (data (1)));
            --UART.write (usb_serial, data);
            exit when UInt8 (Character'Pos (ASCII.LF)) = data (1);
        end loop;
        return true;
    end read_line;


    procedure substr (s : String; a : Integer; b : Integer; o : in out Unbounded_String) is
    begin
        Delete (o, 1, Length (o));
        if b < a or b < 0 or a < 0 then
            return;
        end if;
        Append (o, s (a..b));
    end substr;


    procedure parse_line (device : in out PA1616D_Device; line : String) is
        i : Natural := 0;
        last_i : Natural := 1;
        part : Unbounded_String;
        --cmd : String(1..5) := line(2..6);
        latitude : Float := 0.0;
        longitude : Float := 0.0;
        commas : array (1..32) of Natural := (others => 0);
        nb_commas : Natural := 0;
        start_i : Natural := 1;
    begin
        -- Split between commas
        loop
            i := Index (line, ",", last_i + 1);
            exit when i = 0;
            nb_commas := nb_commas + 1;
            exit when nb_commas > commas'Length;
            commas (nb_commas) := i;
            last_i := i;
        end loop;

        if nb_commas = 0 or commas(1) <= 1 then
            return;
        end if;

        substr (line, 1, commas(1) - 1, part);

        if part = "$GNRMC" or part = "$NRMC" or part = "$MC" then
            start_i := 3;
        elsif part = "$GNGGA" then
            start_i := 2;
        else
            return;
        end if;

        substr (line, commas(start_i)+1, commas(start_i+1)-1, part);

        if (Length(part) = 0) then
            return;
        end if;

        latitude := Float'Value (To_String (part));
        latitude := latitude / 100.0;

        if (line((commas(start_i+1)+1)..(commas(start_i+2)-1))) = "S" then
            latitude := -latitude;
        end if;

        substr (line, commas(start_i+2)+1, commas(start_i+3)-1, part);

        if (Length(part) = 0) then
            return;
        end if;

        longitude := Float'Value (To_String (part));
        longitude := longitude / 100.0;

        if (line((commas(start_i+3)+1)..(commas(start_i+4)-1))) = "W" then
            longitude := -longitude;
        end if;

        -- Main.print ("Latitude : " & latitude'Img & ", Longitude : " & longitude'Img);

        device.latitude := latitude;
        device.longitude := longitude;
    end parse_line;


    procedure init (device : in out PA1616D_Device) is
    begin
        null;
    end init;


    procedure read (device : in out PA1616D_Device) is
        buffer : Unbounded_String;
    begin
        loop
            Delete (buffer, 1, Length (buffer));
            exit when not read_line (device, buffer);
            parse_line (device, To_String (buffer));
            --Main.print (To_String (buffer));
        end loop;
    end read;

end PA1616D;
