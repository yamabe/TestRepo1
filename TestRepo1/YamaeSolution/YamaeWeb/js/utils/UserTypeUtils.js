function UserTypeUtils() {

}

UserTypeUtils.TYPE_NORMAL = "00";
UserTypeUtils.TYPE_FACEBOOK = "01";

UserTypeUtils.isCheck = function(userType, kind) {

	if (userType == kind) {
		return true;
	}

	return false;
};

UserTypeUtils.fbOk = function() {
	if (FB) {
		return true;
	}

	return false;
};
