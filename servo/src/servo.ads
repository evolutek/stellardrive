with STM32.PWM; use STM32.PWM;
with STM32.Timers; use STM32.Timers;
with STM32.GPIO; use STM32.GPIO;
with STM32; use STM32;

package Servo is

    type Servo_Device is record
        modulator : PWM_Modulator;
        min_angle : Float;
        max_angle : Float;
        min_pulse : Microseconds;
        max_pulse : Microseconds;
    end record;

    procedure init (
        device : in out Servo_Device;
        timer : not null access STM32.Timers.Timer;
        channel : Timer_Channel;
        gpio : GPIO_Point;
        AF : GPIO_Alternate_Function;
        freq : Hertz := 50
    );

    procedure set_angle(device : in out Servo_Device; angle : Float);

end Servo;
