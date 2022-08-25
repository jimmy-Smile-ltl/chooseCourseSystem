package classes;

import java.util.Arrays;

public class Students {
	// 定义成员变量
		private String stuId; //学号
		private String stuName; //姓名
		private String stuGrage;//年级
		private String stuProfess; // 专业
		private String stuInstitute; //学院
		private String stuPwd; //密码
		private String stuPhhone; //联系电话
		private String stuCourselearned ;//已修课程
	
		public Students(String stuId, String stuName, String stuGrage, String stuProfess, String stuInstitute,
				String stuPwd, String stuPhhone, String stuCourselearned) {
			super();
			this.stuId = stuId;
			this.stuName = stuName;
			this.stuGrage = stuGrage;
			this.stuProfess = stuProfess;
			this.stuInstitute = stuInstitute;
			this.stuPwd = stuPwd;
			this.stuPhhone = stuPhhone;
			this.stuCourselearned = stuCourselearned;
		}
	public Students() {
			super();
			// TODO Auto-generated constructor stub
		}
	public String getStuId() {
		return stuId;
	}


	public void setStuId(String stuId) {
		this.stuId = stuId;
	}


	public String getStuName() {
		return stuName;
	}


	public void setStuName(String stuName) {
		this.stuName = stuName;
	}


	public String getStuGrage() {
		return stuGrage;
	}


	public void setStuGrage(String stuGrage) {
		this.stuGrage = stuGrage;
	}


	public String getStuProfess() {
		return stuProfess;
	}


	public void setStuProfess(String stuProfess) {
		this.stuProfess = stuProfess;
	}


	public String getStuInstitute() {
		return stuInstitute;
	}


	public void setStuInstitute(String stuInstitute) {
		this.stuInstitute = stuInstitute;
	}


	public String getStuPwd() {
		return stuPwd;
	}


	public void setStuPwd(String stuPwd) {
		this.stuPwd = stuPwd;
	}


	public String getStuPhhone() {
		return stuPhhone;
	}


	public void setStuPhhone(String stuPhhone) {
		this.stuPhhone = stuPhhone;
	}


	public String getStuCourselearned() {
		return stuCourselearned;
	}


	public void setStuCourselearned(String stuCourselearned) {
		this.stuCourselearned = stuCourselearned;
	}
	@Override
	public String toString() {
		return "Students [stuId=" + stuId + ", stuName=" + stuName + ", stuGrage=" + stuGrage + ", stuProfess="
				+ stuProfess + ", stuInstitute=" + stuInstitute + ", stuPwd=" + stuPwd + ", stuPhhone=" + stuPhhone
				+ ", stuCourselearned=" + (stuCourselearned) + "]";
	}
	//已修课程进行切词
	public String [] leraned_split() {
		String learndString [] = null;
		if(this.stuCourselearned.indexOf("-")==-1) {
			learndString[0]="好像是新生，什么都没有学";
		}
		else {
			learndString=this.stuCourselearned.split("、");
		}
		return learndString;
	}


	

	
	
	
	
	
	
}
