class Booking{

  final int id;
  final int slotsCount;
  final String slotsType;
  final int duration;
  final double unitNightCost;
  final String startDate;
  final String parkingTitle;
  final String location;
  final String username;
  final String email;


  const Booking({
    required this.id,
    required this.slotsCount,
    required this.slotsType,
    required this.duration,
    required this.startDate,
    required this.unitNightCost,
    required this.location,
    required this.parkingTitle,
    required this.email,
    required this.username
  });


  factory Booking.fromJson(Map<String, dynamic> json)
    => Booking(
      id: json['id'], 
      slotsCount: json['slotsCount'], 
      slotsType: json['slotsType'], 
      duration: json['duration'], 
      startDate: json['startDate']??"", 
      location: json['location']??"",
      username: json['username']??"",
      email: json['email']??"",
      parkingTitle: json['parkingTitle']??"",
      unitNightCost: json['unitNightCost']);
  

}