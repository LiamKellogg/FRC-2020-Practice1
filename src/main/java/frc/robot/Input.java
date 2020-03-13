package frc.robot;

import edu.wpi.first.wpilibj.Joystick;
import edu.wpi.first.wpilibj2.command.button.JoystickButton;

public class Input {
    private final Joystick joystick0 = new Joystick(0);
    private float dead_zone = 0.1f;
    private float clamp = 0.5f;

    Input() {}

    // Setup button maps here

    public double getForward() {
        if (Math.abs(joystick0.getRawAxis(1)) < dead_zone) {
            return 0f;
        }
        return -joystick0.getRawAxis(1) * clamp;
    }
}