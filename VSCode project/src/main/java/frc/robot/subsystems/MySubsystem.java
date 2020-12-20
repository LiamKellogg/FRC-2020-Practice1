/*----------------------------------------------------------------------------*/
/* Copyright (c) 2018-2019 FIRST. All Rights Reserved.                        */
/* Open Source Software - may be modified and shared by FRC teams. The code   */
/* must be accompanied by the FIRST BSD license file in the root directory of */
/* the project.                                                               */
/*----------------------------------------------------------------------------*/

package frc.robot.subsystems;

import com.revrobotics.CANSparkMax;
import com.revrobotics.CANSparkMaxLowLevel.MotorType;

import edu.wpi.first.wpilibj2.command.SubsystemBase;

public class MySubsystem extends SubsystemBase {
  private final int deviceID = 9;

  private CANSparkMax motor = new CANSparkMax(deviceID, MotorType.kBrushless);
  /**
   * Creates a new ExampleSubsystem.
   */
  public MySubsystem() {
  }

  @Override
  public void periodic() {
    // This method will be called once per scheduler run
  }

  public void move(double speed) {
    motor.set(speed);
  }
}
