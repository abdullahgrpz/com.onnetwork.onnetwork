// lib/features/team/models/team_member_model.dart (TAM VE DÜZELTİLMİŞ)

class TeamMember {
  final String uid;
  final String username; // 'name' alanı GİTTİ, bu geldi.
  final String handle;
  final String? profileImageUrl; // 'imageUrl' alanı GİTTİ, bu geldi (null olabilir).
  final bool isActive;
  final double contribution;

  TeamMember({
    required this.uid,
    required this.username,
    this.profileImageUrl,
    required this.handle,
    required this.isActive,
    required this.contribution,
  });
}