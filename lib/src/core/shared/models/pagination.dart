class AppPagination{
  final int? totalItems;
  final int? countItems;
  final int? perPage;
  final int? currentPage;
  final String? nextPageUrl;
  final int? totalPages;

  AppPagination({
    this.totalItems,
    this.countItems,
    this.perPage,
    this.currentPage,
    this.nextPageUrl,
    this.totalPages,
  });

  factory AppPagination.fromJson(Map<String, dynamic> json){
    return AppPagination(
      totalPages: json['total_pages'],
      totalItems: json['total_items'],
      currentPage: json['total_pages'],
      countItems: json['count_items'],
      nextPageUrl: json['next_page_url'],
      perPage: json['per_page'],
    );
  }
}