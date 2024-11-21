class UserInfoState {
  String? userName;
  String? userNameError;
  String? businessName;
  String? businessNameError;
  String? selectedAudiene;
  Map<String, dynamic>? targetAudience;
  String? targetAudienceError;

  bool? agreedToTerms;
  String? agreedToTermsError;

  String? businessCategory;
  String? businessCategoryError;

  String? description;
  String? descriptionError;

  String? userId;
  String? userIdError;

  UserInfoState({
    this.userName,
    this.userNameError,
    this.businessName,
    this.businessNameError,
    this.selectedAudiene = "Both",
    this.targetAudience,
    this.targetAudienceError,
    this.agreedToTerms = true,
    this.agreedToTermsError,
    this.businessCategory,
    this.businessCategoryError,
    this.description,
    this.descriptionError,
    this.userId,
    this.userIdError,
  });

  UserInfoState copyWith({
    String? userName,
    String? userNameError,
    String? businessName,
    String? businessNameError,
    Map<String, dynamic>? targetAudience,
    String? selectedAudiene,
    String? targetAudienceError,
    bool? agreedToTerms,
    String? agreedToTermsError,
    String? businessCategory,
    String? businessCategoryError,
    String? description,
    String? descriptionError,
    String? userId,
    String? userIdError,
  }) {
    return UserInfoState(
      userName: userName ?? this.userName,
      userNameError: userNameError,
      businessName: businessName ?? this.businessName,
      businessNameError: businessNameError,
      targetAudience: targetAudience ?? this.targetAudience,
      targetAudienceError: targetAudienceError ?? this.targetAudienceError,
      selectedAudiene: selectedAudiene ?? this.selectedAudiene,
      agreedToTerms: agreedToTerms ?? this.agreedToTerms,
      agreedToTermsError: agreedToTermsError ?? this.agreedToTermsError,
      businessCategory: businessCategory ?? this.businessCategory,
      businessCategoryError:
          businessCategoryError ?? this.businessCategoryError,
      description: description ?? this.description,
      descriptionError: descriptionError,
      userId: userId ?? this.userId,
      userIdError: userIdError ?? this.userIdError,
    );
  }

  String? selectedAudHeb(String val) {
    switch (selectedAudiene) {
      case "man":
        "גברים";
      case "woman":
        "נשים";
      case "both":
        "שניהם";
      default:
        "";
    }
  }
}
