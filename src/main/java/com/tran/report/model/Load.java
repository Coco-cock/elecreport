package com.tran.report.model;
/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月15日 下午2:43:11   
* Description:  
*
*@param     
*/

public class Load {
	private double voltage;
	private double current;
	private double power;
	public double getVoltage() {
		return voltage;
	}
	public void setVoltage(double voltage) {
		this.voltage = voltage;
	}
	public double getCurrent() {
		return current;
	}
	public void setCurrent(double current) {
		this.current = current;
	}
	public double getPower() {
		return power;
	}
	public void setPower(double power) {
		this.power = power;
	}
	public Load() {
		super();
	}
	public Load(double voltage, double current, double power) {
		super();
		this.voltage = voltage;
		this.current = current;
		this.power = power;
	}
	@Override
	public String toString() {
		return "Load [voltage=" + voltage + ", current=" + current + ", power=" + power + "]";
	}
	
}
