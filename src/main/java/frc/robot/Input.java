package frc.robot;

import edu.wpi.first.wpilibj.Joystick;
import edu.wpi.first.wpilibj2.command.button.JoystickButton;

public class Input {
    private final Joystick joystick0 = new Joystick(0);

    Input() {}

    // Setup button maps here

    public double getForward() {
        return -joystick0.getRawAxis(1);
    }
}