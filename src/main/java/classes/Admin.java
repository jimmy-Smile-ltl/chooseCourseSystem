package classes;

public class Admin {
	private String AdmId;
	private String AdmName;
	private String AdmPwd;
	
	public Admin(String admId, String admName, String admPwd) {
		super();
		AdmId = admId;
		AdmName = admName;
		AdmPwd = admPwd;
	}
	
	public String getAdmId() {
		return AdmId;
	}
	public void setAdmId(String admId) {
		AdmId = admId;
	}
	public String getAdmName() {
		return AdmName;
	}
	public void setAdmName(String admName) {
		AdmName = admName;
	}
	public String getAdmPwd() {
		return AdmPwd;
	}
	public void setAdmPwd(String admPwd) {
		AdmPwd = admPwd;
	}

	@Override
	public String toString() {
		return "Admin [AdmId=" + AdmId + ", AdmName=" + AdmName + ", AdmPwd=" + AdmPwd + "]";
	}
}
