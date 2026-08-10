abstract class TechnicalStatus {}

class TechnicalIniail extends TechnicalStatus {}

class TechnicalLoading extends TechnicalStatus {}

class TechnicalEmpty extends TechnicalStatus {}

class TechnicalSuccess extends TechnicalStatus {}

class TechnicalErorr extends TechnicalStatus {
  final String message;
  TechnicalErorr({required this.message});
}
