import 'package:flutter/material.dart';

class GlassClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double baseWidth = 120;
    double baseHeight = 175;
    double scaleX = size.width / baseWidth;
    double scaleY = size.height / baseHeight;
    double offset = 16;

    Path path_0 = Path();
    path_0.moveTo((0 + offset) * scaleX, 0 * scaleY);
    path_0.cubicTo(
      (28.71 + offset) * scaleX,
      0 * scaleY,
      (57.42 + offset) * scaleX,
      0 * scaleY,
      (87 + offset) * scaleX,
      0 * scaleY,
    );
    path_0.cubicTo(
      (91 + offset) * scaleX,
      8 * scaleY,
      (91 + offset) * scaleX,
      8 * scaleY,
      (91 + offset) * scaleX,
      11 * scaleY,
    );
    path_0.cubicTo(
      (91.99 + offset) * scaleX,
      11.495 * scaleY,
      (91.99 + offset) * scaleX,
      11.495 * scaleY,
      (93 + offset) * scaleX,
      12 * scaleY,
    );
    path_0.cubicTo(
        (93.8515625 + offset) * scaleX,
        14.3984375 * scaleY,
        (93.8515625 + offset) * scaleX,
        14.3984375 * scaleY,
        (94.625 + offset) * scaleX,
        17.375 * scaleY);
    path_0.cubicTo(
        (94.88539062 + offset) * scaleX,
        18.35210938 * scaleY,
        (95.14578125 + offset) * scaleX,
        19.32921875 * scaleY,
        (95.4140625 + offset) * scaleX,
        20.3359375 * scaleY);
    path_0.cubicTo(
      (96 + offset) * scaleX,
      23 * scaleY,
      (96 + offset) * scaleX,
      23 * scaleY,
      (96 + offset) * scaleX,
      26 * scaleY,
    );
    path_0.cubicTo(
      (96.66 + offset) * scaleX,
      26.33 * scaleY,
      (97.32 + offset) * scaleX,
      26.66 * scaleY,
      (98 + offset) * scaleX,
      27 * scaleY,
    );
    path_0.cubicTo(
        (100.7183988 + offset) * scaleX,
        36.76007269 * scaleY,
        (100.30974105 + offset) * scaleX,
        47.27555045 * scaleY,
        (100.26074219 + offset) * scaleX,
        57.3137207 * scaleY);
    path_0.cubicTo(
        (100.24991844 + offset) * scaleX,
        59.9574219 * scaleY,
        (100.26074978 + offset) * scaleX,
        62.60045859 * scaleY,
        (100.2734375 + offset) * scaleX,
        65.24414062 * scaleY);
    path_0.cubicTo(
        (100.27211744 + offset) * scaleX,
        66.94270982 * scaleY,
        (100.26955823 + offset) * scaleX,
        68.6412786 * scaleY,
        (100.265625 + offset) * scaleX,
        70.33984375 * scaleY);
    path_0.cubicTo(
        (100.26967346 + offset) * scaleX,
        71.12117172 * scaleY,
        (100.27372192 + offset) * scaleX,
        71.90249969 * scaleY,
        (100.27789307 + offset) * scaleX,
        72.70750427 * scaleY);
    path_0.cubicTo(
      (100.22627869 + offset) * scaleX,
      78.75285924 * scaleY,
      (98.88940926 + offset) * scaleX,
      83.65731873 * scaleY,
      (96 + offset) * scaleX,
      89 * scaleY,
    );
    path_0.cubicTo(
        (95.60683594 + offset) * scaleX,
        89.73476562 * scaleY,
        (95.21367188 + offset) * scaleX,
        90.46953125 * scaleY,
        (94.80859375 + offset) * scaleX,
        91.2265625 * scaleY);
    path_0.cubicTo(
      (88.57818593 + offset) * scaleX,
      102.12533858 * scaleY,
      (80.36869926 + offset) * scaleX,
      111.31565037 * scaleY,
      (69 + offset) * scaleX,
      117 * scaleY,
    );
    path_0.cubicTo(
      (69.33 + offset) * scaleX,
      117.66 * scaleY,
      (69.66 + offset) * scaleX,
      118.32 * scaleY,
      (70 + offset) * scaleX,
      119 * scaleY,
    );
    path_0.cubicTo(
      (68.02 + offset) * scaleX,
      119 * scaleY,
      (66.04 + offset) * scaleX,
      119 * scaleY,
      (64 + offset) * scaleX,
      119 * scaleY,
    );
    path_0.cubicTo(
      (63.67 + offset) * scaleX,
      119.66 * scaleY,
      (63.34 + offset) * scaleX,
      120.32 * scaleY,
      (63 + offset) * scaleX,
      121 * scaleY,
    );
    path_0.cubicTo(
      (59.9758532 + offset) * scaleX,
      122.59892298 * scaleY,
      (56.88552993 + offset) * scaleX,
      124.01997354 * scaleY,
      (53.78515625 + offset) * scaleX,
      125.46484375 * scaleY,
    );
    path_0.cubicTo(
      (50.76773637 + offset) * scaleX,
      126.84906151 * scaleY,
      (50.76773637 + offset) * scaleX,
      126.84906151 * scaleY,
      (49 + offset) * scaleX,
      130 * scaleY,
    );
    path_0.cubicTo(
        (48.72529112 + offset) * scaleX,
        132.67768864 * scaleY,
        (48.58421957 + offset) * scaleX,
        135.19625281 * scaleY,
        (48.5625 + offset) * scaleX,
        137.875 * scaleY);
    path_0.cubicTo(
        (48.52962891 + offset) * scaleX,
        138.58269531 * scaleY,
        (48.49675781 + offset) * scaleX,
        139.29039062 * scaleY,
        (48.46289062 + offset) * scaleX,
        140.01953125 * scaleY);
    path_0.cubicTo(
        (48.42317866 + offset) * scaleX,
        143.89686302 * scaleY,
        (48.81532621 + offset) * scaleX,
        145.76064443 * scaleY,
        (51.203125 + offset) * scaleX,
        148.85546875 * scaleY);
    path_0.cubicTo(
        (53.86399009 + offset) * scaleX,
        150.89571307 * scaleY,
        (56.08080753 + offset) * scaleX,
        152.21365145 * scaleY,
        (59.1875 + offset) * scaleX,
        153.4375 * scaleY);
    path_0.cubicTo(
        (60.22132812 + offset) * scaleX,
        153.84484375 * scaleY,
        (61.25515625 + offset) * scaleX,
        154.2521875 * scaleY,
        (62.3203125 + offset) * scaleX,
        154.671875 * scaleY);
    path_0.cubicTo(
        (67.49227555 + offset) * scaleX,
        156.53861326 * scaleY,
        (72.70428104 + offset) * scaleX,
        158.27831974 * scaleY,
        (77.9440918 + offset) * scaleX,
        159.94506836 * scaleY);
    path_0.cubicTo(
        (78.68570557 + offset) * scaleX,
        160.18362549 * scaleY,
        (79.42731934 + offset) * scaleX,
        160.42218262 * scaleY,
        (80.19140625 + offset) * scaleX,
        160.66796875 * scaleY);
    path_0.cubicTo(
        (80.85342041 + offset) * scaleX,
        160.87703857 * scaleY,
        (81.51543457 + offset) * scaleX,
        161.0861084 * scaleY,
        (82.19750977 + offset) * scaleX,
        161.30151367 * scaleY);
    path_0.cubicTo(
      (84 + offset) * scaleX,
      162 * scaleY,
      (84 + offset) * scaleX,
      162 * scaleY,
      (87 + offset) * scaleX,
      164 * scaleY,
    );
    path_0.cubicTo(
      (87.6875 + offset) * scaleX,
      167.125 * scaleY,
      (87.6875 + offset) * scaleX,
      167.125 * scaleY,
      (88 + offset) * scaleX,
      170 * scaleY,
    );
    path_0.cubicTo(
        (87.35933594 + offset) * scaleX,
        170.06058594 * scaleY,
        (86.71867187 + offset) * scaleX,
        170.12117187 * scaleY,
        (86.05859375 + offset) * scaleX,
        170.18359375 * scaleY);
    path_0.cubicTo(
        (85.19363281 + offset) * scaleX,
        170.26738281 * scaleY,
        (84.32867187 + offset) * scaleX,
        170.35117188 * scaleY,
        (83.4375 + offset) * scaleX,
        170.4375 * scaleY);
    path_0.cubicTo(
        (82.59058594 + offset) * scaleX,
        170.51871094 * scaleY,
        (81.74367188 + offset) * scaleX,
        170.59992188 * scaleY,
        (80.87109375 + offset) * scaleX,
        170.68359375 * scaleY);
    path_0.cubicTo(
        (78.92858439 + offset) * scaleX,
        170.89766621 * scaleY,
        (76.99211924 + offset) * scaleX,
        171.17421507 * scaleY,
        (75.06640625 + offset) * scaleX,
        171.50708008 * scaleY);
    path_0.cubicTo(
        (69.75730361 + offset) * scaleX,
        172.26699392 * scaleY,
        (64.41961033 + offset) * scaleX,
        172.18234571 * scaleY,
        (59.06640625 + offset) * scaleX,
        172.203125 * scaleY);
    path_0.cubicTo(
        (57.34030373 + offset) * scaleX,
        172.21167511 * scaleY,
        (57.34030373 + offset) * scaleX,
        172.21167511 * scaleY,
        (55.57933044 + offset) * scaleX,
        172.22039795 * scaleY);
    path_0.cubicTo(
        (53.14607657 + offset) * scaleX,
        172.22982251 * scaleY,
        (50.71281008 + offset) * scaleX,
        172.23637179 * scaleY,
        (48.27954102 + offset) * scaleX,
        172.24023438 * scaleY);
    path_0.cubicTo(
        (44.60604743 + offset) * scaleX,
        172.24988559 * scaleY,
        (40.93312685 + offset) * scaleX,
        172.28091181 * scaleY,
        (37.25976562 + offset) * scaleX,
        172.3125 * scaleY);
    path_0.cubicTo(
      (24.82872098 + offset) * scaleX,
      172.36697906 * scaleY,
      (13.09177588 + offset) * scaleX,
      172.09321787 * scaleY,
      (1 + offset) * scaleX,
      169 * scaleY,
    );
    path_0.cubicTo(
      (0.8515625 + offset) * scaleX,
      166.61328125 * scaleY,
      (0.8515625 + offset) * scaleX,
      166.61328125 * scaleY,
      (1 + offset) * scaleX,
      164 * scaleY,
    );
    path_0.cubicTo(
      (3.3832946 + offset) * scaleX,
      162.18116991 * scaleY,
      (4.95818337 + offset) * scaleX,
      161 * scaleY,
      (8 + offset) * scaleX,
      161 * scaleY,
    );
    path_0.cubicTo(
      (8.33 + offset) * scaleX,
      160.34 * scaleY,
      (8.66 + offset) * scaleX,
      159.68 * scaleY,
      (9 + offset) * scaleX,
      159 * scaleY,
    );
    path_0.cubicTo(
        (10.7578125 + offset) * scaleX,
        158.578125 * scaleY,
        (10.7578125 + offset) * scaleX,
        158.578125 * scaleY,
        (13.125 + offset) * scaleX,
        158.25 * scaleY);
    path_0.cubicTo(
        (17.96469866 + offset) * scaleX,
        157.37577698 * scaleY,
        (22.32782659 + offset) * scaleX,
        155.88136936 * scaleY,
        (26.875 + offset) * scaleX,
        154.0625 * scaleY);
    path_0.cubicTo(
        (27.51711426 + offset) * scaleX,
        153.80952148 * scaleY,
        (28.15922852 + offset) * scaleX,
        153.55654297 * scaleY,
        (28.82080078 + offset) * scaleX,
        153.29589844 * scaleY);
    path_0.cubicTo(
      (32.23034371 + offset) * scaleX,
      151.9005562 * scaleY,
      (35.28164711 + offset) * scaleX,
      150.51480473 * scaleY,
      (38 + offset) * scaleX,
      148 * scaleY,
    );
    path_0.cubicTo(
        (39.19108227 + offset) * scaleX,
        144.4267532 * scaleY,
        (39.27879922 + offset) * scaleX,
        141.39163059 * scaleY,
        (39.375 + offset) * scaleX,
        137.625 * scaleY);
    path_0.cubicTo(
        (39.42398438 + offset) * scaleX,
        136.31789062 * scaleY,
        (39.47296875 + offset) * scaleX,
        135.01078125 * scaleY,
        (39.5234375 + offset) * scaleX,
        133.6640625 * scaleY);
    path_0.cubicTo(
      (38.85288405 + offset) * scaleX,
      128.97018835 * scaleY,
      (37.74800423 + offset) * scaleX,
      127.85653519 * scaleY,
      (34 + offset) * scaleX,
      125 * scaleY,
    );
    path_0.cubicTo(
        (30.98760532 + offset) * scaleX,
        123.22331218 * scaleY,
        (27.88683137 + offset) * scaleX,
        121.66870902 * scaleY,
        (24.75 + offset) * scaleX,
        120.125 * scaleY);
    path_0.cubicTo(
      (14.68083832 + offset) * scaleX,
      114.99231817 * scaleY,
      (6.80596672 + offset) * scaleX,
      109.16997553 * scaleY,
      (-1 + offset) * scaleX,
      101 * scaleY,
    );
    path_0.cubicTo(
        (-1.80824219 + offset) * scaleX,
        100.24976562 * scaleY,
        (-1.80824219 + offset) * scaleX,
        100.24976562 * scaleY,
        (-2.6328125 + offset) * scaleX,
        99.484375 * scaleY);
    path_0.cubicTo(
      (-4 + offset) * scaleX,
      98 * scaleY,
      (-4 + offset) * scaleX,
      98 * scaleY,
      (-5 + offset) * scaleX,
      95 * scaleY,
    );
    path_0.cubicTo(
      (-5.515625 + offset) * scaleX,
      93.989375 * scaleY,
      (-6.03125 + offset) * scaleX,
      92.97875 * scaleY,
      (-6.5625 + offset) * scaleX,
      91.9375 * scaleY,
    );
    path_0.cubicTo(
      (-8 + offset) * scaleX,
      89 * scaleY,
      (-8 + offset) * scaleX,
      89 * scaleY,
      (-8 + offset) * scaleX,
      87 * scaleY,
    );
    path_0.cubicTo(
      (-8.66 + offset) * scaleX,
      86.67 * scaleY,
      (-9.32 + offset) * scaleX,
      86.34 * scaleY,
      (-10 + offset) * scaleX,
      86 * scaleY,
    );
    path_0.cubicTo(
      (-10.38218767 + offset) * scaleX,
      84.34385343 * scaleY,
      (-10.71395102 + offset) * scaleX,
      82.67542976 * scaleY,
      (-11 + offset) * scaleX,
      81 * scaleY,
    );
    path_0.cubicTo(
      (-11.33 + offset) * scaleX,
      80.34 * scaleY,
      (-11.66 + offset) * scaleX,
      79.68 * scaleY,
      (-12 + offset) * scaleX,
      79 * scaleY,
    );
    path_0.cubicTo(
        (-12.09921225 + offset) * scaleX,
        77.60709988 * scaleY,
        (-12.13827954 + offset) * scaleX,
        76.20964391 * scaleY,
        (-12.14526367 + offset) * scaleX,
        74.81323242 * scaleY);
    path_0.cubicTo(
        (-12.15164352 + offset) * scaleX,
        73.94860886 * scaleY,
        (-12.15802338 + offset) * scaleX,
        73.08398529 * scaleY,
        (-12.16459656 + offset) * scaleX,
        72.19316101 * scaleY);
    path_0.cubicTo(
        (-12.16570938 + offset) * scaleX,
        71.25672256 * scaleY,
        (-12.1668222 + offset) * scaleX,
        70.32028412 * scaleY,
        (-12.16796875 + offset) * scaleX,
        69.35546875 * scaleY);
    path_0.cubicTo(
        (-12.17129715 + offset) * scaleX,
        68.39353104 * scaleY,
        (-12.17462555 + offset) * scaleX,
        67.43159332 * scaleY,
        (-12.17805481 + offset) * scaleX,
        66.44050598 * scaleY);
    path_0.cubicTo(
        (-12.18312412 + offset) * scaleX,
        64.40199258 * scaleY,
        (-12.18546313 + offset) * scaleX,
        62.36347087 * scaleY,
        (-12.18530273 + offset) * scaleX,
        60.32495117 * scaleY);
    path_0.cubicTo(
        (-12.1874838 + offset) * scaleX,
        57.21063467 * scaleY,
        (-12.20562453 + offset) * scaleX,
        54.09667541 * scaleY,
        (-12.22460938 + offset) * scaleX,
        50.98242188 * scaleY);
    path_0.cubicTo(
        (-12.2275444 + offset) * scaleX,
        49.00260538 * scaleY,
        (-12.22952846 + offset) * scaleX,
        47.02248891 * scaleY,
        (-12.23193359 + offset) * scaleX,
        45.04248047 * scaleY);
    path_0.cubicTo(
        (-12.23193359 + offset) * scaleX,
        45.04248047 * scaleY,
        (-12.23193359 + offset) * scaleX,
        42.02832031 * scaleY,
        (-12.23193359 + offset) * scaleX,
        42.02832031 * scaleY);
    path_0.cubicTo(
      (-12.23193359 + offset) * scaleX,
      42.02832031 * scaleY,
      (-12.23193359 + offset) * scaleX,
      39 * scaleY,
      (-12.23193359 + offset) * scaleX,
      39 * scaleY,
    );
    path_0.cubicTo(
      (-12.23193359 + offset) * scaleX,
      36 * scaleY,
      (-12.23193359 + offset) * scaleX,
      36 * scaleY,
      (-10 + offset) * scaleX,
      27 * scaleY,
    );
    path_0.cubicTo(
      (-9.34 + offset) * scaleX,
      26.67 * scaleY,
      (-8.68 + offset) * scaleX,
      26.34 * scaleY,
      (-8 + offset) * scaleX,
      26 * scaleY,
    );
    path_0.cubicTo(
      (-8 + offset) * scaleX,
      23 * scaleY,
      (-8 + offset) * scaleX,
      23 * scaleY,
      (-7 + offset) * scaleX,
      20 * scaleY,
    );
    path_0.cubicTo(
        (-6.72721875 + offset) * scaleX,
        18.7734375 * scaleY,
        (-6.4544375 + offset) * scaleX,
        17.546875 * scaleY,
        (-6.1875 + offset) * scaleX,
        16.3125 * scaleY);
    path_0.cubicTo(
      (-5.4375 + offset) * scaleX,
      14 * scaleY,
      (-5.4375 + offset) * scaleX,
      14 * scaleY,
      (-4 + offset) * scaleX,
      12 * scaleY,
    );
    path_0.cubicTo(
      (-3.34 + offset) * scaleX,
      11.67 * scaleY,
      (-2.68 + offset) * scaleX,
      11.34 * scaleY,
      (-2 + offset) * scaleX,
      11 * scaleY,
    );
    path_0.cubicTo(
      (-1.34570312 + offset) * scaleX,
      8.74804688 * scaleY,
      (-1.34570312 + offset) * scaleX,
      8.74804688 * scaleY,
      (0 + offset) * scaleX,
      0 * scaleY,
    );

    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
