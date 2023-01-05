extension svgWithPath on String{
  String getSvg () => 'assets/images/$this.svg';
}
extension imageWithPath on String{
  String getimage () => 'assets/images/$this.png';
}