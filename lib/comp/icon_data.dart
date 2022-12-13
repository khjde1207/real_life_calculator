import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconsData {
  static Widget plus() {
    var str =
        """<svg width="36px" height="36px" viewBox="0 0 36 36" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" role="img" class="iconify iconify--twemoji" preserveAspectRatio="xMidYMid meet"><path fill="#DC9628" d="M31 15H21V5a3 3 0 1 0-6 0v10H5a3 3 0 1 0 0 6h10v10a3 3 0 1 0 6 0V21h10a3 3 0 1 0 0-6z"></path></svg>""";
    return SvgPicture.string(str);
  }

  static Widget minus() {
    var str = """<svg
   width="36"
   height="36"
   viewBox="0 0 36 36"
   aria-hidden="true"
   role="img"
   class="iconify iconify--twemoji"
   preserveAspectRatio="xMidYMid"
   version="1.1"
   id="svg4"
   sodipodi:docname="plus-svgrepo-com.svg"
   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
   xmlns="http://www.w3.org/2000/svg"
   xmlns:svg="http://www.w3.org/2000/svg">

  <path
     fill="#dc9628"
     d="m 31,15 c -10.851666,0 -2.457289,0 -26,0 -3.9999983,0 -3.9999983,6 0,6 18.580491,0 9.665239,0 26,0 3.999998,0 3.999998,-6 0,-6 z"
     id="path2"
     sodipodi:nodetypes="ccccc" />
</svg>
""";
    return SvgPicture.string(str);
  }

  static Widget cross() {
    var str = """<svg
   width="36"
   height="36"
   viewBox="0 0 36 36"
   aria-hidden="true"
   role="img"
   class="iconify iconify--twemoji"
   preserveAspectRatio="xMidYMid"
   version="1.1"
   id="svg4"
   sodipodi:docname="plus-svgrepo-com.svg"
   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
   xmlns="http://www.w3.org/2000/svg"
   xmlns:svg="http://www.w3.org/2000/svg">
  
  <path
     fill="#dc9628"
     d="M 29.313708,25.071068 22.242641,18 29.313708,10.928932 A 3,3 0 1 0 25.071068,6.6862915 L 18,13.757359 10.928932,6.6862915 A 3,3 0 1 0 6.6862915,10.928932 L 13.757359,18 6.6862915,25.071068 a 3,3 0 1 0 4.2426405,4.24264 L 18,22.242641 l 7.071068,7.071067 a 3,3 0 1 0 4.24264,-4.24264 z"
     id="path2" />
</svg>""";
    return SvgPicture.string(str);
  }

  static Widget divide() {
    var str =
        """<svg width="36px" height="36px" viewBox="0 0 36 36" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" role="img" class="iconify iconify--twemoji" preserveAspectRatio="xMidYMid meet"><path fill="#DC9628" d="M34 18a3 3 0 0 1-3 3H5a3 3 0 1 1 0-6h26a3 3 0 0 1 3 3z"></path><circle fill="#DC9628" cx="18" cy="7" r="4"></circle><circle fill="#DC9628" cx="18" cy="29" r="4"></circle></svg>""";
    return SvgPicture.string(str);
  }

  static Widget eq({Color color = Colors.orange}) {
    var str = """<svg
   width="36"
   height="36"
   viewBox="0 0 36 36"
   aria-hidden="true"
   role="img"
   class="iconify iconify--twemoji"
   preserveAspectRatio="xMidYMid"
   version="1.1"
   id="svg4"
   sodipodi:docname="plus-svgrepo-com.svg"
   inkscape:export-filename="minus-svgrepo-com.svg"
   inkscape:export-xdpi="96"
   inkscape:export-ydpi="96"
   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
   xmlns="http://www.w3.org/2000/svg"
   xmlns:svg="http://www.w3.org/2000/svg">
  
  <path
     fill="#dc9628"
     d="m 31.000001,7.499 c -10.851666,0 -2.457289,0 -26.000001,0 -3.999999,0 -3.999999,6 0,6 18.580491,0 9.665239,0 26.000001,0 3.999998,0 3.999998,-6 0,-6 z"
     id="path2"
     sodipodi:nodetypes="ccccc" />
  <path
     fill="#dc9628"
     d="m 31,22.501 c -10.851666,0 -2.457289,0 -26.0000002,0 -3.999998,0 -3.999998,6 0,6 18.5804902,0 9.6652392,0 26.0000002,0 3.999998,0 3.999998,-6 0,-6 z"
     id="path2-3"
     sodipodi:nodetypes="ccccc" />
</svg>""";
    return SvgPicture.string(
      str,
      color: color,
    );
  }

  static Widget per() {
    var str = """<svg
   width="36"
   height="36"
   viewBox="0 0 36 36"
   aria-hidden="true"
   role="img"
   class="iconify iconify--twemoji"
   preserveAspectRatio="xMidYMid"
   version="1.1"
   id="svg367"
   sodipodi:docname="divide-svgrepo-com.svg"
   inkscape:export-filename="per-svgrepo-com.png"
   inkscape:export-xdpi="96"
   inkscape:export-ydpi="96"
   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
   xmlns="http://www.w3.org/2000/svg"
   xmlns:svg="http://www.w3.org/2000/svg">
  
  <path
     fill="#dc9628"
     d="m 29.313708,6.6862915 a 3,3 0 0 1 0,4.2426405 L 10.928932,29.313708 A 3,3 0 1 1 6.6862915,25.071068 L 25.071068,6.6862915 a 3,3 0 0 1 4.24264,0 z"
     id="path361" />
  <circle
     fill="#dc9628"
     cx="1.7763568e-15"
     cy="14.455844"
     r="4"
     id="circle363"
     transform="rotate(-45)" />
  <circle
     fill="#dc9628"
     cx="0"
     cy="36.455845"
     r="4"
     id="circle365"
     transform="rotate(-45)" />
</svg>""";
    return SvgPicture.string(str);
  }

  static Widget parenthesis() {
    var str = """
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg
   width="36"
   height="36"
   viewBox="0 0 36 36"
   aria-hidden="true"
   role="img"
   class="iconify iconify--twemoji"
   preserveAspectRatio="xMidYMid"
   version="1.1"
   id="svg614"
   sodipodi:docname="parenthesis-svgrepo-com.svg"
   inkscape:export-filename="parenthesis-svgrepo-com.png"
   inkscape:export-xdpi="96"
   inkscape:export-ydpi="96"
   inkscape:version="1.2.1 (9c6d41e410, 2022-07-14, custom)"
   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
   xmlns="http://www.w3.org/2000/svg"
   xmlns:svg="http://www.w3.org/2000/svg">
  
  <g
     id="g693"
     transform="matrix(1.655984,0,0,1.655984,-14.082664,-12.797227)">
    <g
       id="g407"
       transform="matrix(0.04252103,0,0,0.04252103,8.4883717,7.7121601)">
      <g
         id="g405">
        <path
           d="M 206.23809,88.919 C 212.31609,81.986 201.593,71.438 194.659,65.358 187.727,59.281 138.85552,59.972 132.77452,66.906 86.890514,119.244 61.621515,186.398 61.621515,256 c 0,69.602 25.268999,136.756 71.154005,189.094 3.301,3.764 46.24148,5.689 50.88448,5.689 3.907,0 7.831,-1.365 11,-4.142 6.933,-6.079 17.65809,-16.627 11.57909,-23.561 -83.509,-95.251 -83.509,-238.91 -0.001,-334.161 z"
           id="path403"
           sodipodi:nodetypes="cccscsccc" />
      </g>
    </g>
    <g
       id="g413"
       transform="matrix(0.04252103,0,0,0.04252103,8.4883717,7.7121601)">
      <g
         id="g411" />
    </g>
  </g>
  <g
     id="g693-3"
     transform="matrix(-1.655984,0,0,1.655984,50.546483,-12.797227)">
    <g
       id="g407-5"
       transform="matrix(0.04252103,0,0,0.04252103,8.4883717,7.7121601)">
      <g
         id="g405-6">
        <path
           d="M 206.23809,88.919 C 212.31609,81.986 201.593,71.438 194.659,65.358 187.727,59.281 138.85552,59.972 132.77452,66.906 86.890514,119.244 61.621515,186.398 61.621515,256 c 0,69.602 25.268999,136.756 71.154005,189.094 3.301,3.764 46.24148,5.689 50.88448,5.689 3.907,0 7.831,-1.365 11,-4.142 6.933,-6.079 17.65809,-16.627 11.57909,-23.561 -83.509,-95.251 -83.509,-238.91 -0.001,-334.161 z"
           id="path403-2"
           sodipodi:nodetypes="cccscsccc" />
      </g>
    </g>
    <g
       id="g413-9"
       transform="matrix(0.04252103,0,0,0.04252103,8.4883717,7.7121601)">
      <g
         id="g411-1" />
    </g>
  </g>
</svg>

""";
    return SvgPicture.string(
      str,
      color: Colors.orange,
    );
  }
}
