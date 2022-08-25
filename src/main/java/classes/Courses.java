package classes;

public class Courses {
//（1）课程表（教师、课程名称、课程代码、先行课、上课时间、上课地点、人数限制、已选人数）
private String  CuoTeacher;
private String  CuoName;
private String 	CuoId;
private String  CuoPro;//先修课
private String  CuoTime;
private String  CuoPosition;
private int  CuoLimmit;
private int CuoChoesd;
public Courses() {
	super();
	// TODO Auto-generated constructor stub
}
public Courses(String cuoTeacher, String cuoName, String cuoId, String cuoPro, String cuoTime, String cuoPosition,
		int cuoLimmit, int cuoChoesd) {
	super();
	CuoTeacher = cuoTeacher;
	CuoName = cuoName;
	CuoId = cuoId;
	CuoPro = cuoPro;
	CuoTime = cuoTime;
	CuoPosition = cuoPosition;
	CuoLimmit = cuoLimmit;
	CuoChoesd = cuoChoesd;
}

public String getCuoTeacher() {
	return CuoTeacher;
}
public void setCuoTeacher(String cuoTeacher) {
	CuoTeacher = cuoTeacher;
}
public String getCuoName() {
	return CuoName;
}
public void setCuoName(String cuoName) {
	CuoName = cuoName;
}
public String getCuoId() {
	return CuoId;
}
public void setCuoId(String cuoId) {
	CuoId = cuoId;
}
public String getCuoPro() {
	return CuoPro;
}
public void setCuoPro(String cuoPro) {
	CuoPro = cuoPro;
}
public String getCuoTime() {
	return CuoTime;
}
public void setCuoTime(String cuoTime) {
	CuoTime = cuoTime;
}
public String getCuoPosition() {
	return CuoPosition;
}
public void setCuoPosition(String cuoPosition) {
	CuoPosition = cuoPosition;
}
public int getCuoLimmit() {
	return CuoLimmit;
}
public void setCuoLimmit(int cuoLimmit) {
	CuoLimmit = cuoLimmit;
}
public int getCuoChoesd() {
	return CuoChoesd;
}
public void setCuoChoesd(int cuoChoesd) {
	CuoChoesd = cuoChoesd;
}
public String [] getSchudule() {
	String [] lo=new  String [3];
	if(CuoTime.indexOf("一")!=-1) {
		lo[0]="1";
	}
	if(CuoTime.indexOf("二")!=-1) {
		lo[0]="2";
	}
	if(CuoTime.indexOf("三")!=-1) {
		lo[0]="3";
	}
	if(CuoTime.indexOf("四")!=-1) {
		lo[0]="4";
	}
	if(CuoTime.indexOf("五")!=-1) {
		lo[0]="5";
	}
	String temp []=CuoTime.split("-");
	if(temp[0].indexOf("8:30")!=-1) {
		lo[1]="1";
	}
	if(temp[0].indexOf("9:25")!=-1) {
		lo[1]="2";
	}
	if(temp[0].indexOf("10:20")!=-1) {
		lo[1]="3";
	}
	if(temp[0].indexOf("11:15")!=-1) {
		lo[1]="4";
	}
	if(temp[0].indexOf("13:00")!=-1) {
		lo[1]="5";
	}
	if(temp[0].indexOf("13:55")!=-1) {
		lo[1]="6";
	}
	if(temp[0].indexOf("14:50")!=-1) {
		lo[1]="7";
	}
	if(temp[0].indexOf("15:45")!=-1) {
		lo[1]="8";
	}
	if(temp[0].indexOf("16:40")!=-1) {
		lo[1]="9";
	}
	if(temp[0].indexOf("18:30")!=-1) {
		lo[1]="10";
	}
	if(temp[0].indexOf("19:25")!=-1) {
		lo[1]="11";
	}
	if(temp[0].indexOf("20:20")!=-1) {
		lo[1]="12";
	}
	if(temp[1].indexOf("9:15")!=-1) {
		lo[2]="1";
	}
	if(temp[1].indexOf("10:10")!=-1) {
		lo[2]="2";
	}
	if(temp[1].indexOf("11:05")!=-1) {
		lo[2]="3";
	}
	if(temp[1].indexOf("12:00")!=-1) {
		lo[2]="4";
	}
	if(temp[1].indexOf("13:45")!=-1) {
		lo[2]="5";
	}
	if(temp[1].indexOf("14:40")!=-1) {
		lo[2]="6";
	}
	if(temp[1].indexOf("15:35")!=-1) {
		lo[2]="7";
	}
	if(temp[1].indexOf("16:30")!=-1) {
		lo[2]="8";
	}
	if(temp[1].indexOf("17:25")!=-1) {
		lo[2]="9";
	}
	if(temp[1].indexOf("19:15")!=-1) {
		lo[2]="10";
	}
	if(temp[1].indexOf("20:10")!=-1) {
		lo[2]="11";
	}
	if(temp[1].indexOf("21:05")!=-1) {
		lo[2]="12";
	}

	
	
	return lo;
	
}

public String toString() {
	return "Courses [CuoTeacher=" + CuoTeacher + ", CuoName=" + CuoName + ", CuoId=" + CuoId + ", CuoPro=" + CuoPro
			+ ", CuoTime=" + CuoTime + ", CuoPosition=" + CuoPosition + ", CuoLimmit=" + CuoLimmit + ", CuoChoesd="
			+ CuoChoesd + "]";
}
}
