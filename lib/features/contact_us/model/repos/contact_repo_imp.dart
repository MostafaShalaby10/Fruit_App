import 'package:task_one/core/networking/api_service.dart';
import 'package:task_one/features/contact_us/model/repos/contact_repo_interface.dart';

class ContactRepoImp implements ContactRepoInterface {
  ApiService _apiService;
  ContactRepoImp(this._apiService);

  @override
  Future getAbout() async{
  
    return await _apiService.getResponse(endPoint: "about-us");
  }

  @override
  Future getTerms() async{
        return await _apiService.getResponse(endPoint: "conditions");

  }
}
