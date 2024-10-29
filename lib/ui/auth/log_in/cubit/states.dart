abstract class LoginStates {}

class InitialState extends LoginStates {}

class ShowLoadingState extends LoginStates {}

class HidingLoadingState extends LoginStates {}

class ShowMessageState extends LoginStates {}

class SuccessLoginState extends LoginStates {}

class ErrorLoginState extends LoginStates {}
