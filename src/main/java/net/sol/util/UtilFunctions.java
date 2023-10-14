package net.sol.util;

public class UtilFunctions {
	public static String getMessage (String status, String names) {
		if(status.equalsIgnoreCase("accept")) {
			return "Hey "+ names +", \n We are pleased to inform you that your application to our university has been accepted, We'll reach out for what comes next.";
		}else if(status.equalsIgnoreCase("reject")) {
			return "Hey "+ names +", \n Due to not enough places being available in our institution, we regret to inform you that your application has been denied \n, Good luck in your future endeavors";
		}
		return "Sorry to bother you " + names;
	}
}
