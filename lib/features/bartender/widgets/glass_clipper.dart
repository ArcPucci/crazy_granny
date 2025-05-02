import 'package:flutter/material.dart';

class GlassClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double baseWidth = 100;
    double baseHeight = 172.3;
    double scaleX = size.width / baseWidth;
    double scaleY = size.height / baseHeight;

    Path path_0 = Path();
    // path_0.moveTo(43 * scaleX, 0 * scaleY);
    // path_0.cubicTo(28.71 * scaleX, 0 * scaleY, 57.42 * scaleX, 0 * scaleY,
    //     87 * scaleX, 0 * scaleY);
    // path_0.cubicTo(91 * scaleX, 8 * scaleY, 91 * scaleX, 8 * scaleY,
    //     91 * scaleX, 11 * scaleY);
    // path_0.cubicTo(91.99 * scaleX, 11.495 * scaleY, 91.99 * scaleX,
    //     11.495 * scaleY, 93 * scaleX, 12 * scaleY);
    // path_0.cubicTo(
    //     93.8515625 * scaleX,
    //     14.3984375 * scaleY,
    //     93.8515625 * scaleX,
    //     14.3984375 * scaleY,
    //     94.625 * scaleX,
    //     17.375 * scaleY);
    // path_0.cubicTo(
    //     94.88539062 * scaleX,
    //     18.35210938 * scaleY,
    //     95.14578125 * scaleX,
    //     19.32921875 * scaleY,
    //     95.4140625 * scaleX,
    //     20.3359375 * scaleY);
    // path_0.cubicTo(96 * scaleX, 23 * scaleY, 96 * scaleX, 23 * scaleY,
    //     96 * scaleX, 26 * scaleY);
    // path_0.cubicTo(96.66 * scaleX, 26.33 * scaleY, 97.32 * scaleX,
    //     26.66 * scaleY, 98 * scaleX, 27 * scaleY);
    // path_0.cubicTo(
    //     100.7183988 * scaleX,
    //     36.76007269 * scaleY,
    //     100.30974105 * scaleX,
    //     47.27555045 * scaleY,
    //     100.26074219 * scaleX,
    //     57.3137207 * scaleY);
    // path_0.cubicTo(
    //     100.24991844 * scaleX,
    //     59.9574219 * scaleY,
    //     100.26074978 * scaleX,
    //     62.60045859 * scaleY,
    //     100.2734375 * scaleX,
    //     65.24414062 * scaleY);
    // path_0.cubicTo(
    //     100.27211744 * scaleX,
    //     66.94270982 * scaleY,
    //     100.26955823 * scaleX,
    //     68.6412786 * scaleY,
    //     100.265625 * scaleX,
    //     70.33984375 * scaleY);
    // path_0.cubicTo(
    //     100.26967346 * scaleX,
    //     71.12117172 * scaleY,
    //     100.27372192 * scaleX,
    //     71.90249969 * scaleY,
    //     100.27789307 * scaleX,
    //     72.70750427 * scaleY);
    // path_0.cubicTo(100.22627869 * scaleX, 78.75285924 * scaleY,
    //     98.88940926 * scaleX, 83.65731873 * scaleY, 96 * scaleX, 89 * scaleY);
    // path_0.cubicTo(
    //     95.60683594 * scaleX,
    //     89.73476562 * scaleY,
    //     95.21367188 * scaleX,
    //     90.46953125 * scaleY,
    //     94.80859375 * scaleX,
    //     91.2265625 * scaleY);
    // path_0.cubicTo(88.57818593 * scaleX, 102.12533858 * scaleY,
    //     80.36869926 * scaleX, 111.31565037 * scaleY, 69 * scaleX, 117 * scaleY);
    // path_0.cubicTo(69.33 * scaleX, 117.66 * scaleY, 69.66 * scaleX,
    //     118.32 * scaleY, 70 * scaleX, 119 * scaleY);
    // path_0.cubicTo(68.02 * scaleX, 119 * scaleY, 66.04 * scaleX, 119 * scaleY,
    //     64 * scaleX, 119 * scaleY);
    // path_0.cubicTo(63.67 * scaleX, 119.66 * scaleY, 63.34 * scaleX,
    //     120.32 * scaleY, 63 * scaleX, 121 * scaleY);
    // path_0.cubicTo(
    //     59.9758532 * scaleX,
    //     122.59892298 * scaleY,
    //     56.88552993 * scaleX,
    //     124.01997354 * scaleY,
    //     53.78515625 * scaleX,
    //     125.46484375 * scaleY);
    // path_0.cubicTo(50.76773637 * scaleX, 126.84906151 * scaleY,
    //     50.76773637 * scaleX, 126.84906151 * scaleY, 49 * scaleX, 130 * scaleY);
    // path_0.cubicTo(
    //     48.72529112 * scaleX,
    //     132.67768864 * scaleY,
    //     48.58421957 * scaleX,
    //     135.19625281 * scaleY,
    //     48.5625 * scaleX,
    //     137.875 * scaleY);
    // path_0.cubicTo(
    //     48.52962891 * scaleX,
    //     138.58269531 * scaleY,
    //     48.49675781 * scaleX,
    //     139.29039062 * scaleY,
    //     48.46289062 * scaleX,
    //     140.01953125 * scaleY);
    // path_0.cubicTo(
    //     48.42317866 * scaleX,
    //     143.89686302 * scaleY,
    //     48.81532621 * scaleX,
    //     145.76064443 * scaleY,
    //     51.203125 * scaleX,
    //     148.85546875 * scaleY);
    // path_0.cubicTo(
    //     53.86399009 * scaleX,
    //     150.89571307 * scaleY,
    //     56.08080753 * scaleX,
    //     152.21365145 * scaleY,
    //     59.1875 * scaleX,
    //     153.4375 * scaleY);
    // path_0.cubicTo(
    //     60.22132812 * scaleX,
    //     153.84484375 * scaleY,
    //     61.25515625 * scaleX,
    //     154.2521875 * scaleY,
    //     62.3203125 * scaleX,
    //     154.671875 * scaleY);
    // path_0.cubicTo(
    //     67.49227555 * scaleX,
    //     156.53861326 * scaleY,
    //     72.70428104 * scaleX,
    //     158.27831974 * scaleY,
    //     77.9440918 * scaleX,
    //     159.94506836 * scaleY);
    // path_0.cubicTo(
    //     78.68570557 * scaleX,
    //     160.18362549 * scaleY,
    //     79.42731934 * scaleX,
    //     160.42218262 * scaleY,
    //     80.19140625 * scaleX,
    //     160.66796875 * scaleY);
    // path_0.cubicTo(
    //     80.85342041 * scaleX,
    //     160.87703857 * scaleY,
    //     81.51543457 * scaleX,
    //     161.0861084 * scaleY,
    //     82.19750977 * scaleX,
    //     161.30151367 * scaleY);
    // path_0.cubicTo(84 * scaleX, 162 * scaleY, 84 * scaleX, 162 * scaleY,
    //     87 * scaleX, 164 * scaleY);
    // path_0.cubicTo(87.6875 * scaleX, 167.125 * scaleY, 87.6875 * scaleX,
    //     167.125 * scaleY, 88 * scaleX, 170 * scaleY);
    // path_0.cubicTo(
    //     87.35933594 * scaleX,
    //     170.06058594 * scaleY,
    //     86.71867187 * scaleX,
    //     170.12117187 * scaleY,
    //     86.05859375 * scaleX,
    //     170.18359375 * scaleY);
    // path_0.cubicTo(
    //     85.19363281 * scaleX,
    //     170.26738281 * scaleY,
    //     84.32867187 * scaleX,
    //     170.35117188 * scaleY,
    //     83.4375 * scaleX,
    //     170.4375 * scaleY);
    // path_0.cubicTo(
    //     82.59058594 * scaleX,
    //     170.51871094 * scaleY,
    //     81.74367188 * scaleX,
    //     170.59992188 * scaleY,
    //     80.87109375 * scaleX,
    //     170.68359375 * scaleY);
    // path_0.cubicTo(
    //     78.92858439 * scaleX,
    //     170.89766621 * scaleY,
    //     76.99211924 * scaleX,
    //     171.17421507 * scaleY,
    //     75.06640625 * scaleX,
    //     171.50708008 * scaleY);
    // path_0.cubicTo(
    //     69.75730361 * scaleX,
    //     172.26699392 * scaleY,
    //     64.41961033 * scaleX,
    //     172.18234571 * scaleY,
    //     59.06640625 * scaleX,
    //     172.203125 * scaleY);
    // path_0.cubicTo(
    //     57.34030373 * scaleX,
    //     172.21167511 * scaleY,
    //     57.34030373 * scaleX,
    //     172.21167511 * scaleY,
    //     55.57933044 * scaleX,
    //     172.22039795 * scaleY);
    // path_0.cubicTo(
    //     53.14607657 * scaleX,
    //     172.22982251 * scaleY,
    //     50.71281008 * scaleX,
    //     172.23637179 * scaleY,
    //     48.27954102 * scaleX,
    //     172.24023438 * scaleY);
    // path_0.cubicTo(
    //     36.60604743 * scaleX,
    //     172.24988559 * scaleY,
    //     20.93312685 * scaleX,
    //     172.28091181 * scaleY,
    //     43.25976562 * scaleX,
    //     172.3125 * scaleY);
    //
    // // path_0.cubicTo(24.82872098 * scaleX, 172.36697906 * scaleY, 13.09177588 * scaleX, 172.09321787 * scaleY, 1 * scaleX, 169 * scaleY);
    // // path_0.cubicTo(0.8515625 * scaleX, 166.61328125 * scaleY, 0.8515625 * scaleX, 166.61328125 * scaleY, 1 * scaleX, 164 * scaleY);
    // // path_0.cubicTo(3.3832946 * scaleX, 162.18116991 * scaleY, 4.95818337 * scaleX, 161 * scaleY, 8 * scaleX, 161 * scaleY);
    // // path_0.cubicTo(8.33 * scaleX, 160.34 * scaleY, 8.66 * scaleX, 159.68 * scaleY, 9 * scaleX, 159 * scaleY);
    // // path_0.cubicTo(10.7578125 * scaleX, 158.578125 * scaleY, 10.7578125 * scaleX, 158.578125 * scaleY, 13.125 * scaleX, 158.25 * scaleY);
    // // path_0.cubicTo(17.96469866 * scaleX, 157.37577698 * scaleY, 22.32782659 * scaleX, 155.88136936 * scaleY, 26.875 * scaleX, 154.0625 * scaleY);
    // // path_0.cubicTo(27.51711426 * scaleX, 153.80952148 * scaleY, 28.15922852 * scaleX, 153.55654297 * scaleY, 28.82080078 * scaleX, 153.29589844 * scaleY);
    // // path_0.cubicTo(32.23034371 * scaleX, 151.9005562 * scaleY, 35.28164711 * scaleX, 150.51480473 * scaleY, 38 * scaleX, 148 * scaleY);
    // // path_0.cubicTo(39.19108227 * scaleX, 144.4267532 * scaleY, 39.27879922 * scaleX, 141.39163059 * scaleY, 39.375 * scaleX, 137.625 * scaleY);
    // // path_0.cubicTo(39.42398438 * scaleX, 136.31789062 * scaleY, 39.47296875 * scaleX, 135.01078125 * scaleY, 39.5234375 * scaleX, 133.6640625 * scaleY);
    // // path_0.cubicTo(38.85288405 * scaleX, 128.97018835 * scaleY, 37.74800423 * scaleX, 127.85653519 * scaleY, 34 * scaleX, 125 * scaleY);
    // // path_0.cubicTo(30.98760532 * scaleX, 123.22331218 * scaleY, 27.88683137 * scaleX, 121.66870902 * scaleY, 24.75 * scaleX, 120.125 * scaleY);
    // // path_0.cubicTo(14.68083832 * scaleX, 114.99231817 * scaleY, 6.80596672 * scaleX, 109.16997553 * scaleY, -1 * scaleX, 101 * scaleY);
    //
    // path_0.moveTo((100 - 43 - 14) * scaleX, 0 * scaleY);
    // path_0.cubicTo(
    //     (100 - 28.71 - 14) * scaleX, 0 * scaleY,
    //     (100 - 57.42 - 14) * scaleX, 0 * scaleY,
    //     (100 - 87 - 14) * scaleX, 0 * scaleY
    // );
    // path_0.cubicTo((100 - 91 - 14) * scaleX, 8 * scaleY, (100 - 91 - 14) * scaleX, 8 * scaleY, (100 - 91 - 14) * scaleX, 11 * scaleY);
    // path_0.cubicTo((100 - 91.99 - 14) * scaleX, 11.495 * scaleY, (100 - 91.99 - 14) * scaleX, 11.495 * scaleY, (100 - 93 - 14) * scaleX, 12 * scaleY);
    // path_0.cubicTo((100 - 93.8515625 - 14) * scaleX, 14.3984375 * scaleY, (100 - 93.8515625 - 14) * scaleX, 14.3984375 * scaleY, (100 - 94.625 - 14) * scaleX, 17.375 * scaleY);
    // path_0.cubicTo((100 - 94.88539062 - 14) * scaleX, 18.35210938 * scaleY, (100 - 95.14578125 - 14) * scaleX, 19.32921875 * scaleY, (100 - 95.4140625 - 14) * scaleX, 20.3359375 * scaleY);
    // path_0.cubicTo((100 - 96 - 14) * scaleX, 23 * scaleY, (100 - 96 - 14) * scaleX, 23 * scaleY, (100 - 96 - 14) * scaleX, 26 * scaleY);
    // path_0.cubicTo((100 - 96.66 - 14) * scaleX, 26.33 * scaleY, (100 - 97.32 - 14) * scaleX, 26.66 * scaleY, (100 - 98 - 14) * scaleX, 27 * scaleY);
    // path_0.cubicTo((100 - 100.7183988 - 14) * scaleX, 36.76007269 * scaleY, (100 - 100.30974105 - 14) * scaleX, 47.27555045 * scaleY, (100 - 100.26074219 - 14) * scaleX, 57.3137207 * scaleY);
    // path_0.cubicTo((100 - 100.24991844 - 14) * scaleX, 59.9574219 * scaleY, (100 - 100.26074978 - 14) * scaleX, 62.60045859 * scaleY, (100 - 100.2734375 - 14) * scaleX, 65.24414062 * scaleY);
    // path_0.cubicTo((100 - 100.27211744 - 14) * scaleX, 66.94270982 * scaleY, (100 - 100.26955823 - 14) * scaleX, 68.6412786 * scaleY, (100 - 100.265625 - 14) * scaleX, 70.33984375 * scaleY);
    // path_0.cubicTo((100 - 100.26967346 - 14) * scaleX, 71.12117172 * scaleY, (100 - 100.27372192 - 14) * scaleX, 71.90249969 * scaleY, (100 - 100.27789307 - 14) * scaleX, 72.70750427 * scaleY);
    // path_0.cubicTo((100 - 100.22627869 - 14) * scaleX, 78.75285924 * scaleY, (100 - 98.88940926 - 14) * scaleX, 83.65731873 * scaleY, (100 - 96 - 14) * scaleX, 89 * scaleY);
    // path_0.cubicTo((100 - 95.60683594 - 14) * scaleX, 89.73476562 * scaleY, (100 - 95.21367188 - 14) * scaleX, 90.46953125 * scaleY, (100 - 94.80859375 - 14) * scaleX, 91.2265625 * scaleY);
    // path_0.cubicTo((100 - 88.57818593 - 14) * scaleX, 102.12533858 * scaleY, (100 - 80.36869926 - 14) * scaleX, 111.31565037 * scaleY, (100 - 69 - 14) * scaleX, 117 * scaleY);
    // path_0.cubicTo((100 - 69.33 - 14) * scaleX, 117.66 * scaleY, (100 - 69.66 - 14) * scaleX, 118.32 * scaleY, (100 - 70 - 14) * scaleX, 119 * scaleY);
    // path_0.cubicTo((100 - 68.02 - 14) * scaleX, 119 * scaleY, (100 - 66.04 - 14) * scaleX, 119 * scaleY, (100 - 64 - 14) * scaleX, 119 * scaleY);
    // path_0.cubicTo((100 - 63.67 - 14) * scaleX, 119.66 * scaleY, (100 - 63.34 - 14) * scaleX, 120.32 * scaleY, (100 - 63 - 14) * scaleX, 121 * scaleY);
    // path_0.cubicTo((100 - 59.9758532 - 14) * scaleX, 122.59892298 * scaleY, (100 - 56.88552993 - 14) * scaleX, 124.01997354 * scaleY, (100 - 53.78515625 - 14) * scaleX, 125.46484375 * scaleY);
    // path_0.cubicTo((100 - 50.76773637 - 14) * scaleX, 126.84906151 * scaleY, (100 - 50.76773637 - 14) * scaleX, 126.84906151 * scaleY, (100 - 49 - 14) * scaleX, 130 * scaleY);
    // path_0.cubicTo((100 - 48.72529112 - 14) * scaleX, 132.67768864 * scaleY, (100 - 48.58421957 - 14) * scaleX, 135.19625281 * scaleY, (100 - 48.5625 - 14) * scaleX, 137.875 * scaleY);
    // path_0.cubicTo((100 - 48.52962891 - 14) * scaleX, 138.58269531 * scaleY, (100 - 48.49675781 - 14) * scaleX, 139.29039062 * scaleY, (100 - 48.46289062 - 14) * scaleX, 140.01953125 * scaleY);
    // path_0.cubicTo((100 - 48.42317866 - 14) * scaleX, 143.89686302 * scaleY, (100 - 48.81532621 - 14) * scaleX, 145.76064443 * scaleY, (100 - 51.203125 - 14) * scaleX, 148.85546875 * scaleY);
    // path_0.cubicTo((100 - 53.86399009 - 14) * scaleX, 150.89571307 * scaleY, (100 - 56.08080753 - 14) * scaleX, 152.21365145 * scaleY, (100 - 59.1875 - 14) * scaleX, 153.4375 * scaleY);
    // path_0.cubicTo((100 - 60.22132812 - 14) * scaleX, 153.84484375 * scaleY, (100 - 61.25515625 - 14) * scaleX, 154.2521875 * scaleY, (100 - 62.3203125 - 14) * scaleX, 154.671875 * scaleY);
    // path_0.cubicTo((100 - 67.49227555 - 14) * scaleX, 156.53861326 * scaleY, (100 - 72.70428104 - 14) * scaleX, 158.27831974 * scaleY, (100 - 77.9440918 - 14) * scaleX, 159.94506836 * scaleY);
    // path_0.cubicTo((100 - 78.68570557 - 14) * scaleX, 160.18362549 * scaleY, (100 - 79.42731934 - 14) * scaleX, 160.42218262 * scaleY, (100 - 80.19140625 - 14) * scaleX, 160.66796875 * scaleY);
    // path_0.cubicTo((100 - 80.85342041 - 14) * scaleX, 160.87703857 * scaleY, (100 - 81.51543457 - 14) * scaleX, 161.0861084 * scaleY, (100 - 82.19750977 - 14) * scaleX, 161.30151367 * scaleY);
    // path_0.cubicTo((100 - 84 - 14) * scaleX, 162 * scaleY, (100 - 84 - 14) * scaleX, 162 * scaleY, (100 - 87 - 14) * scaleX, 164 * scaleY);
    // path_0.cubicTo((100 - 87.6875 - 14) * scaleX, 167.125 * scaleY, (100 - 87.6875 - 14) * scaleX, 167.125 * scaleY, (100 - 88 - 14) * scaleX, 170 * scaleY);
    // path_0.cubicTo((100 - 87.35933594 - 14) * scaleX, 170.06058594 * scaleY, (100 - 86.71867187 - 14) * scaleX, 170.12117187 * scaleY, (100 - 86.05859375 - 14) * scaleX, 170.18359375 * scaleY);
    // path_0.cubicTo((100 - 85.19363281 - 14) * scaleX, 170.26738281 * scaleY, (100 - 84.32867187 - 14) * scaleX, 170.35117188 * scaleY, (100 - 83.4375 - 14) * scaleX, 170.4375 * scaleY);
    // path_0.cubicTo((100 - 82.59058594 - 14) * scaleX, 170.51871094 * scaleY, (100 - 81.74367188 - 14) * scaleX, 170.59992188 * scaleY, (100 - 80.87109375 - 14) * scaleX, 170.68359375 * scaleY);
    // path_0.cubicTo((100 - 78.92858439 - 14) * scaleX, 170.89766621 * scaleY, (100 - 76.99211924 - 14) * scaleX, 171.17421507 * scaleY, (100 - 75.06640625 - 14) * scaleX, 171.50708008 * scaleY);
    // path_0.cubicTo((100 - 69.75730361 - 14) * scaleX, 172.26699392 * scaleY, (100 - 64.41961033 - 14) * scaleX, 172.18234571 * scaleY, (100 - 59.06640625 - 14) * scaleX, 172.203125 * scaleY);
    // path_0.cubicTo((100 - 57.34030373 - 14) * scaleX, 172.21167511 * scaleY, (100 - 57.34030373 - 14) * scaleX, 172.21167511 * scaleY, (100 - 55.57933044 - 14) * scaleX, 172.22039795 * scaleY);
    // path_0.cubicTo((100 - 53.14607657 - 14) * scaleX, 172.22982251 * scaleY, (100 - 50.71281008 - 14) * scaleX, 172.23637179 * scaleY, (100 - 48.27954102 - 14) * scaleX, 172.24023438 * scaleY);
    // path_0.cubicTo((100 - 36.60604743 - 14) * scaleX, 172.24988559 * scaleY, (100 - 20.93312685 - 14) * scaleX, 172.28091181 * scaleY, (100 - 43.25976562 - 14) * scaleX, 172.3125 * scaleY);
    //
    path_0.moveTo(0 * scaleX, 0 * scaleY);
    path_0.cubicTo(
      28.71 * scaleX, 0 * scaleY,
      57.42 * scaleX, 0 * scaleY,
      87 * scaleX, 0 * scaleY,
    );
    path_0.cubicTo(91 * scaleX, 8 * scaleY, 91 * scaleX, 8 * scaleY, 91 * scaleX, 11 * scaleY);
    path_0.cubicTo(91.99 * scaleX, 11.495 * scaleY, 91.99 * scaleX, 11.495 * scaleY, 93 * scaleX, 12 * scaleY);
    path_0.cubicTo(93.8515625 * scaleX, 14.3984375 * scaleY, 93.8515625 * scaleX, 14.3984375 * scaleY, 94.625 * scaleX, 17.375 * scaleY);
    path_0.cubicTo(94.88539062 * scaleX, 18.35210938 * scaleY, 95.14578125 * scaleX, 19.32921875 * scaleY, 95.4140625 * scaleX, 20.3359375 * scaleY);
    path_0.cubicTo(96 * scaleX, 23 * scaleY, 96 * scaleX, 23 * scaleY, 96 * scaleX, 26 * scaleY);
    path_0.cubicTo(96.66 * scaleX, 26.33 * scaleY, 97.32 * scaleX, 26.66 * scaleY, 98 * scaleX, 27 * scaleY);
    path_0.cubicTo(100.7183988 * scaleX, 36.76007269 * scaleY, 100.30974105 * scaleX, 47.27555045 * scaleY, 100.26074219 * scaleX, 57.3137207 * scaleY);
    path_0.cubicTo(100.24991844 * scaleX, 59.9574219 * scaleY, 100.26074978 * scaleX, 62.60045859 * scaleY, 100.2734375 * scaleX, 65.24414062 * scaleY);
    path_0.cubicTo(100.27211744 * scaleX, 66.94270982 * scaleY, 100.26955823 * scaleX, 68.6412786 * scaleY, 100.265625 * scaleX, 70.33984375 * scaleY);
    path_0.cubicTo(100.26967346 * scaleX, 71.12117172 * scaleY, 100.27372192 * scaleX, 71.90249969 * scaleY, 100.27789307 * scaleX, 72.70750427 * scaleY);
    path_0.cubicTo(100.22627869 * scaleX, 78.75285924 * scaleY, 98.88940926 * scaleX, 83.65731873 * scaleY, 96 * scaleX, 89 * scaleY);
    path_0.cubicTo(95.60683594 * scaleX, 89.73476562 * scaleY, 95.21367188 * scaleX, 90.46953125 * scaleY, 94.80859375 * scaleX, 91.2265625 * scaleY);
    path_0.cubicTo(88.57818593 * scaleX, 102.12533858 * scaleY, 80.36869926 * scaleX, 111.31565037 * scaleY, 69 * scaleX, 117 * scaleY);
    path_0.cubicTo(69.33 * scaleX, 117.66 * scaleY, 69.66 * scaleX, 118.32 * scaleY, 70 * scaleX, 119 * scaleY);
    path_0.cubicTo(68.02 * scaleX, 119 * scaleY, 66.04 * scaleX, 119 * scaleY, 64 * scaleX, 119 * scaleY);
    path_0.cubicTo(63.67 * scaleX, 119.66 * scaleY, 63.34 * scaleX, 120.32 * scaleY, 63 * scaleX, 121 * scaleY);
    path_0.cubicTo(59.9758532 * scaleX, 122.59892298 * scaleY, 56.88552993 * scaleX, 124.01997354 * scaleY, 53.78515625 * scaleX, 125.46484375 * scaleY);
    path_0.cubicTo(50.76773637 * scaleX, 126.84906151 * scaleY, 50.76773637 * scaleX, 126.84906151 * scaleY, 49 * scaleX, 130 * scaleY);
    path_0.cubicTo(48.72529112 * scaleX, 132.67768864 * scaleY, 48.58421957 * scaleX, 135.19625281 * scaleY, 48.5625 * scaleX, 137.875 * scaleY);
    path_0.cubicTo(48.52962891 * scaleX, 138.58269531 * scaleY, 48.49675781 * scaleX, 139.29039062 * scaleY, 48.46289062 * scaleX, 140.01953125 * scaleY);
    path_0.cubicTo(48.42317866 * scaleX, 143.89686302 * scaleY, 48.81532621 * scaleX, 145.76064443 * scaleY, 51.203125 * scaleX, 148.85546875 * scaleY);
    path_0.cubicTo(53.86399009 * scaleX, 150.89571307 * scaleY, 56.08080753 * scaleX, 152.21365145 * scaleY, 59.1875 * scaleX, 153.4375 * scaleY);
    path_0.cubicTo(60.22132812 * scaleX, 153.84484375 * scaleY, 61.25515625 * scaleX, 154.2521875 * scaleY, 62.3203125 * scaleX, 154.671875 * scaleY);
    path_0.cubicTo(67.49227555 * scaleX, 156.53861326 * scaleY, 72.70428104 * scaleX, 158.27831974 * scaleY, 77.9440918 * scaleX, 159.94506836 * scaleY);
    path_0.cubicTo(78.68570557 * scaleX, 160.18362549 * scaleY, 79.42731934 * scaleX, 160.42218262 * scaleY, 80.19140625 * scaleX, 160.66796875 * scaleY);
    path_0.cubicTo(80.85342041 * scaleX, 160.87703857 * scaleY, 81.51543457 * scaleX, 161.0861084 * scaleY, 82.19750977 * scaleX, 161.30151367 * scaleY);
    path_0.cubicTo(84 * scaleX, 162 * scaleY, 84 * scaleX, 162 * scaleY, 87 * scaleX, 164 * scaleY);
    path_0.cubicTo(87.6875 * scaleX, 167.125 * scaleY, 87.6875 * scaleX, 167.125 * scaleY, 88 * scaleX, 170 * scaleY);
    path_0.cubicTo(87.35933594 * scaleX, 170.06058594 * scaleY, 86.71867187 * scaleX, 170.12117187 * scaleY, 86.05859375 * scaleX, 170.18359375 * scaleY);
    path_0.cubicTo(85.19363281 * scaleX, 170.26738281 * scaleY, 84.32867187 * scaleX, 170.35117188 * scaleY, 83.4375 * scaleX, 170.4375 * scaleY);
    path_0.cubicTo(82.59058594 * scaleX, 170.51871094 * scaleY, 81.74367188 * scaleX, 170.59992188 * scaleY, 80.87109375 * scaleX, 170.68359375 * scaleY);
    path_0.cubicTo(78.92858439 * scaleX, 170.89766621 * scaleY, 76.99211924 * scaleX, 171.17421507 * scaleY, 75.06640625 * scaleX, 171.50708008 * scaleY);
    path_0.cubicTo(69.75730361 * scaleX, 172.26699392 * scaleY, 64.41961033 * scaleX, 172.18234571 * scaleY, 59.06640625 * scaleX, 172.203125 * scaleY);
    path_0.cubicTo(57.34030373 * scaleX, 172.21167511 * scaleY, 57.34030373 * scaleX, 172.21167511 * scaleY, 55.57933044 * scaleX, 172.22039795 * scaleY);
    path_0.cubicTo(53.14607657 * scaleX, 172.22982251 * scaleY, 50.71281008 * scaleX, 172.23637179 * scaleY, 48.27954102 * scaleX, 172.24023438 * scaleY);
    path_0.cubicTo(44.60604743 * scaleX, 172.24988559 * scaleY, 40.93312685 * scaleX, 172.28091181 * scaleY, 37.25976562 * scaleX, 172.3125 * scaleY);
    path_0.cubicTo(24.82872098 * scaleX, 172.36697906 * scaleY, 13.09177588 * scaleX, 172.09321787 * scaleY, 1 * scaleX, 169 * scaleY);
    path_0.cubicTo(0.8515625 * scaleX, 166.61328125 * scaleY, 0.8515625 * scaleX, 166.61328125 * scaleY, 1 * scaleX, 164 * scaleY);
    path_0.cubicTo(3.3832946 * scaleX, 162.18116991 * scaleY, 4.95818337 * scaleX, 161 * scaleY, 8 * scaleX, 161 * scaleY);
    path_0.cubicTo(8.33 * scaleX, 160.34 * scaleY, 8.66 * scaleX, 159.68 * scaleY, 9 * scaleX, 159 * scaleY);
    path_0.cubicTo(10.7578125 * scaleX, 158.578125 * scaleY, 10.7578125 * scaleX, 158.578125 * scaleY, 13.125 * scaleX, 158.25 * scaleY);
    path_0.cubicTo(17.96469866 * scaleX, 157.37577698 * scaleY, 22.32782659 * scaleX, 155.88136936 * scaleY, 26.875 * scaleX, 154.0625 * scaleY);
    path_0.cubicTo(27.51711426 * scaleX, 153.80952148 * scaleY, 28.15922852 * scaleX, 153.55654297 * scaleY, 28.82080078 * scaleX, 153.29589844 * scaleY);
    path_0.cubicTo(32.23034371 * scaleX, 151.9005562 * scaleY, 35.28164711 * scaleX, 150.51480473 * scaleY, 38 * scaleX, 148 * scaleY);
    path_0.cubicTo(39.19108227 * scaleX, 144.4267532 * scaleY, 39.27879922 * scaleX, 141.39163059 * scaleY, 39.375 * scaleX, 137.625 * scaleY);
    path_0.cubicTo(39.42398438 * scaleX, 136.31789062 * scaleY, 39.47296875 * scaleX, 135.01078125 * scaleY, 39.5234375 * scaleX, 133.6640625 * scaleY);
    path_0.cubicTo(38.85288405 * scaleX, 128.97018835 * scaleY, 37.74800423 * scaleX, 127.85653519 * scaleY, 34 * scaleX, 125 * scaleY);
    path_0.cubicTo(30.98760532 * scaleX, 123.22331218 * scaleY, 27.88683137 * scaleX, 121.66870902 * scaleY, 24.75 * scaleX, 120.125 * scaleY);
    path_0.cubicTo(14.68083832 * scaleX, 114.99231817 * scaleY, 6.80596672 * scaleX, 109.16997553 * scaleY, -1 * scaleX, 101 * scaleY);
    path_0.cubicTo(-1.80824219 * scaleX, 100.24976562 * scaleY, -1.80824219 * scaleX, 100.24976562 * scaleY, -2.6328125 * scaleX, 99.484375 * scaleY);
    path_0.cubicTo(-4 * scaleX, 98 * scaleY, -4 * scaleX, 98 * scaleY, -5 * scaleX, 95 * scaleY);
    path_0.cubicTo(-5.515625 * scaleX, 93.989375 * scaleY, -6.03125 * scaleX, 92.97875 * scaleY, -6.5625 * scaleX, 91.9375 * scaleY);
    path_0.cubicTo(-8 * scaleX, 89 * scaleY, -8 * scaleX, 89 * scaleY, -8 * scaleX, 87 * scaleY);
    path_0.cubicTo(-8.66 * scaleX, 86.67 * scaleY, -9.32 * scaleX, 86.34 * scaleY, -10 * scaleX, 86 * scaleY);
    path_0.cubicTo(-10.38218767 * scaleX, 84.34385343 * scaleY, -10.71395102 * scaleX, 82.67542976 * scaleY, -11 * scaleX, 81 * scaleY);
    path_0.cubicTo(-11.33 * scaleX, 80.34 * scaleY, -11.66 * scaleX, 79.68 * scaleY, -12 * scaleX, 79 * scaleY);
    path_0.cubicTo(-12.09921225 * scaleX, 77.60709988 * scaleY, -12.13827954 * scaleX, 76.20964391 * scaleY, -12.14526367 * scaleX, 74.81323242 * scaleY);
    path_0.cubicTo(-12.15164352 * scaleX, 73.94860886 * scaleY, -12.15802338 * scaleX, 73.08398529 * scaleY, -12.16459656 * scaleX, 72.19316101 * scaleY);
    path_0.cubicTo(-12.16570938 * scaleX, 71.25672256 * scaleY, -12.1668222 * scaleX, 70.32028412 * scaleY, -12.16796875 * scaleX, 69.35546875 * scaleY);
    path_0.cubicTo(-12.17129715 * scaleX, 68.39353104 * scaleY, -12.17462555 * scaleX, 67.43159332 * scaleY, -12.17805481 * scaleX, 66.44050598 * scaleY);
    path_0.cubicTo(-12.18312412 * scaleX, 64.40199258 * scaleY, -12.18546313 * scaleX, 62.36347087 * scaleY, -12.18530273 * scaleX, 60.32495117 * scaleY);
    path_0.cubicTo(-12.1874838 * scaleX, 57.21063467 * scaleY, -12.20562453 * scaleX, 54.09667541 * scaleY, -12.22460938 * scaleX, 50.98242188 * scaleY);
    path_0.cubicTo(-12.2275444 * scaleX, 49.00260538 * scaleY, -12.22952846 * scaleX, 47.02248891 * scaleY, -12.23193359 * scaleX, 45.04248047 * scaleY);
    path_0.cubicTo(-12.23193359 * scaleX, 45.04248047 * scaleY, -12.23193359 * scaleX, 42.02832031 * scaleY, -12.23193359 * scaleX, 42.02832031 * scaleY);
    path_0.cubicTo(-12.23193359 * scaleX, 42.02832031 * scaleY, -12.23193359 * scaleX, 39 * scaleY, -12.23193359 * scaleX, 39 * scaleY);
    path_0.cubicTo(-12.23193359 * scaleX, 36 * scaleY, -12.23193359 * scaleX, 36 * scaleY, -10 * scaleX, 27 * scaleY);
    path_0.cubicTo(-9.34 * scaleX, 26.67 * scaleY, -8.68 * scaleX, 26.34 * scaleY, -8 * scaleX, 26 * scaleY);
    path_0.cubicTo(-8 * scaleX, 23 * scaleY, -8 * scaleX, 23 * scaleY, -7 * scaleX, 20 * scaleY);
    path_0.cubicTo(-6.72721875 * scaleX, 18.7734375 * scaleY, -6.4544375 * scaleX, 17.546875 * scaleY, -6.1875 * scaleX, 16.3125 * scaleY);
    path_0.cubicTo(-5.4375 * scaleX, 14 * scaleY, -5.4375 * scaleX, 14 * scaleY, -4 * scaleX, 12 * scaleY);
    path_0.cubicTo(-3.34 * scaleX, 11.67 * scaleY, -2.68 * scaleX, 11.34 * scaleY, -2 * scaleX, 11 * scaleY);
    path_0.cubicTo(-1.34570312 * scaleX, 8.74804688 * scaleY, -1.34570312 * scaleX, 8.74804688 * scaleY, 0 * scaleX, 0 * scaleY);

    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
