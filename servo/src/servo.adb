with HAL; use HAL;

package body Servo is

    procedure init (
        device : in out Servo_Device;
        timer : not null access STM32.Timers.Timer;
        channel : Timer_Channel;
        gpio : GPIO_Point;
        AF : GPIO_Alternate_Function;
        freq : Hertz := 50
    ) is
    begin
        Configure_PWM_Timer (timer, freq);  -- Initialisation de la fréquence
        Attach_PWM_Channel (device.modulator,
            timer,
            channel, -- Initialisation du channel du timer. Channel trouvable à l'aide de l'ioc fourni. Variables (pour les channels) définies dans le fichier ads device.
            gpio, -- Pin de sortie du PWM. Variables (pour les pins) définies dans le fichier ads device.
            AF -- "Abstract function" désignant le timer 4. Le 2 correspond peut-être au prescaler et/ou à la division de la variable hertz. Cette valeur (2) n'a pas été choisie. Variables (pour les "abstract functions" et leurs valeurs étranges) définies dans le fichier ads device.
        );
        Enable_Output (device.modulator);  -- On allume le PWM. La fonction inverse existe aussi.
        null;
    end init;

    --procedure my_set_duty_time
    --    (This  : in out PWM_Modulator;
    --    Value : Microseconds)
    --is
    --    Pulse16       : UInt16;
    --    Pulse32       : UInt32;
    --    Period        : constant UInt32 := Timer_Period (This) + 1;
    --    uS_Per_Period : constant UInt32 := Microseconds_Per_Period (This);
    --begin
    --    if Value = 0 then
    --        Set_Compare_Value (This.Generator.all, This.Channel, UInt16'(0));
    --    else
    --        --  for a Value of 0, the computation of Pulse wraps around, so we
    --        --  only compute it when not zero
    --        if Has_32bit_CC_Values (This.Generator.all) then
    --            Pulse32 := UInt32 ((Period / uS_Per_Period) * Value) - 1;
    --            Set_Compare_Value (This.Generator.all, This.Channel, Pulse32);
    --        else
    --            Pulse16 := UInt16 ((Period / uS_Per_Period) * Value) - 1;
    --            Set_Compare_Value (This.Generator.all, This.Channel, Pulse16);
    --        end if;
    --    end if;
    --end my_set_duty_time;

    procedure set_angle(device : in out Servo_Device; angle : Float) is
        good_angle : Float := angle;
        coef : Float;
    begin
        if good_angle > device.max_angle then
            good_angle := device.max_angle;
        end if;
        if good_angle < device.min_angle then
            good_angle := device.min_angle;
        end if;
        coef := (good_angle - device.min_angle) / (device.max_angle - device.min_angle);
        Set_Duty_Time(device.modulator, device.min_pulse + Microseconds (Float (device.max_pulse - device.min_pulse) * coef));
        --Modulator.Set_Duty_Cycle (2 + Integer (Value));
    end set_angle;

end Servo;

--procedure STM32_Blinky_Demo is
--   type ni2in is mod 12;  -- Les valeurs de duty cycle ayant fait leurs preuves varient de 2 a 13%.
--   Next_Release : Time := Clock;  -- Délai, sans rapport avec les pwm.
--   Value : ni2in := 0;
--   Modulator : PWM_Modulator;  -- Possibilité d'en déclarer plusieurs
--   Frequency : constant Hertz := 100;  -- Ce sont, dans cet exemple, des demi hertz donc là on est a 50 hertz. Checker à l'oscillo si besoin.
--   Selected_Timer : STM32.Timers.Timer renames Timer_4;  -- Sucre syntaxique pour renommer Timer_4. Inutile. Variables (pour les timers) définies dans le fichier ads device.
--begin
--end STM32_Blinky_Demo;
