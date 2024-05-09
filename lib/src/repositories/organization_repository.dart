import 'package:models/models.dart';
import 'package:org_management/src/apis/organization_api.dart';

class OrganizationRepository {
  final OrganizationAPI _organizationAPI;

  OrganizationRepository({
    required OrganizationAPI organizationAPI,
  }) : _organizationAPI = organizationAPI;

  Future<Organization> getOrganization(String id) async {
    final document = await _organizationAPI.getOrganizationData(id);
    final organization =
        Organization.fromJson(document.data() as Map<String, dynamic>);
    return organization;
  }

  Future createOrganization(Organization org) async {
    await _organizationAPI.createOrganizationData(org);
  }

  Future updateOrganization(Organization org) async {
    await _organizationAPI.updateOrganizationData(org);
  }
}
