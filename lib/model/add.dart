class AddItem {
  String? id;
  String? addText;
  bool done;

  AddItem({
    required this.id,
    required this.addText,
    this.done = false,
  });

  static List<AddItem> daftarItem() {
    return [
      AddItem(id: '01', addText: 'Kasih makan kucing & ikan', done: true),
      AddItem(id: '02', addText: 'Kerjain UAS Pemrograman Mobile', done: true),
      AddItem(id: '03', addText: 'Tidur buat kerja', ),
      AddItem(id: '04', addText: 'Laundry baju', ),
    ];
  }
}