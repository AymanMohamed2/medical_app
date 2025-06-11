enum EcgStatusEnum {
  normal,
  abnormal;

  factory EcgStatusEnum.fromString(String status) {
    switch (status) {
      case 'Normal':
        return EcgStatusEnum.normal;
      case 'Abnormal':
        return EcgStatusEnum.abnormal;
      default:
        return EcgStatusEnum.normal;
    }
  }
}
