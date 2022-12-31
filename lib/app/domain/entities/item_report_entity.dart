class ItemReportEntity {
  final String? reporttype,
      mainCategory,
      name,
      description,
      photo,
      itemId,
      reportStatus,
      city,
      country,
      phone,
      date,
      userId;
  const ItemReportEntity(
    this.itemId,
    this.reporttype,
    this.name,
    this.description,
    this.mainCategory,
    this.city,
    this.country,
    this.photo,
    this.reportStatus,
    this.phone,
    this.date,
    this.userId,
  );
}
