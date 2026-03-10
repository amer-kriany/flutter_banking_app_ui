import 'package:banking_app/Offers.dart';
import 'package:banking_app/Wallet.dart';
import 'package:banking_app/settings.dart';
import 'package:banking_app/statistic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TapBar extends StatefulWidget {
  final ValueChanged<int>? onTabChanged;
  final int initialIndex;

  const TapBar({super.key, this.onTabChanged, this.initialIndex = 0});

  @override
  State<TapBar> createState() => _TapBarState();
}

class _TapBarState extends State<TapBar> {
  late int _selectedIndex;

  static const Color _color = Color(0xFF200E32);
  static const Color _chipBg = Color(0x0D250447); // rgba(37,4,71,0.05)
  static const String _fontFamily = 'Mont'; // change to match your font asset

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onTap(int index) async {
    if (_selectedIndex == index) return;
    setState(() => _selectedIndex = index);
    widget.onTabChanged?.call(index);
    await Future.delayed(Duration(milliseconds: 300));

    final pages = [Wallet(), Offers(), Statistic(), settings()];

    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (context) => pages[index]));
  }

  @override
  Widget build(BuildContext context) {
    final List<_TabData> tabs = [
      _TabData(label: 'Wallet', svgPath: _SvgPaths.wallet),
      const _TabData(label: 'Offers', svgPath: _SvgPaths.star),
      const _TabData(label: 'Statistic', svgPath: _SvgPaths.graph),
      const _TabData(label: 'Profile', svgPath: _SvgPaths.profile),
    ];

    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(tabs.length, (i) {
                final tab = tabs[i];
                final isSelected = i == _selectedIndex;
                return _TapBarItem(
                  label: tab.label,
                  svgPath: tab.svgPath,
                  isSelected: isSelected,
                  color: _color,
                  chipColor: _chipBg,
                  fontFamily: _fontFamily,
                  onTap: () => _onTap(i),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Individual Item ──────────────────────────────────────────────────────────

class _TapBarItem extends StatelessWidget {
  final String label;
  final String svgPath;
  final bool isSelected;
  final Color color;
  final Color chipColor;
  final String fontFamily;
  final VoidCallback onTap;

  const _TapBarItem({
    required this.label,
    required this.svgPath,
    required this.isSelected,
    required this.color,
    required this.chipColor,
    required this.fontFamily,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 260),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 18 : 10,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: isSelected ? chipColor : Colors.transparent,
          borderRadius: BorderRadius.circular(52),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon
            AnimatedOpacity(
              duration: const Duration(milliseconds: 220),
              opacity: isSelected ? 0.85 : 0.50,
              child: SizedBox(
                width: 35,
                height: 35,
                child: SvgPicture.string(
                  _buildSvg(svgPath),
                  colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                ),
              ),
            ),

            // Label (slides in when selected)
            AnimatedSize(
              duration: const Duration(milliseconds: 260),
              curve: Curves.easeInOut,
              child: isSelected
                  ? Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: Text(
                        label,
                        style: TextStyle(
                          color: color.withOpacity(0.85),
                          fontSize: 18,
                          fontFamily: fontFamily,
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  static String _buildSvg(String pathData) =>
      '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 35 35" fill="none">
  <path d="$pathData" fill="#200E32"/>
</svg>''';
}

// ─── SVG Path Data (from Figma) ───────────────────────────────────────────────

class _SvgPaths {
  _SvgPaths._();

  static const String wallet =
      'M21.1685 0C26.1982 0 29.1667 2.8942 29.1667 7.84846H22.9963V7.89901C20.1326 7.89901 17.8111 10.1624 17.8111 12.9544C17.8111 15.7464 20.1326 18.0098 22.9963 18.0098H29.1667V18.4647C29.1667 23.3558 26.1982 26.25 21.1685 26.25H7.99815C2.96852 26.25 0 23.3558 0 18.4647V7.78527C0 2.8942 2.96852 0 7.99815 0H21.1685ZM28.0778 10.0223C28.6792 10.0223 29.1667 10.4976 29.1667 11.0839V14.7743C29.1597 15.3578 28.6762 15.8291 28.0778 15.8359H23.113C21.6632 15.855 20.3955 14.8872 20.0667 13.5105C19.902 12.6558 20.1332 11.774 20.6982 11.1012C21.2633 10.4283 22.1045 10.0334 22.9963 10.0223H28.0778ZM23.6963 11.7285H23.2167C22.9222 11.7251 22.6386 11.8368 22.4291 12.0386C22.2197 12.2404 22.1019 12.5156 22.1019 12.8027C22.1018 13.4051 22.5989 13.8953 23.2167 13.9023H23.6963C24.312 13.9023 24.8111 13.4156 24.8111 12.8154C24.8111 12.2151 24.312 11.7285 23.6963 11.7285ZM15.1407 5.67465H6.90926C6.29859 5.67461 5.80155 6.15358 5.79445 6.74892C5.79445 7.35128 6.29147 7.84154 6.90926 7.84846H15.1407C15.7564 7.84846 16.2556 7.36184 16.2556 6.76156C16.2556 6.16127 15.7564 5.67465 15.1407 5.67465Z';

  static const String star =
      'M14.5833 0C15.419 0.004375 16.1802 0.476875 16.5521 1.225L19.8494 7.84583C19.864 7.86042 19.8785 7.875 19.8917 7.875L27.2738 8.93958C27.8513 9.02125 28.3748 9.32458 28.7321 9.78542C29.3898 10.6663 29.2892 11.8956 28.4988 12.6583L23.1467 17.8354C23.1467 17.8354 23.1365 17.8456 23.1365 17.85C23.1365 17.8544 23.1365 17.85 23.1467 17.8646L24.43 25.1708C24.605 26.3594 23.7942 27.4706 22.6071 27.6646C22.4933 27.6806 22.3767 27.6908 22.2615 27.6908C21.8998 27.6923 21.5425 27.6033 21.2231 27.4312L14.63 23.9896C14.6096 23.9881 14.5892 23.994 14.5717 24.0042L7.93333 27.475C7.62708 27.6296 7.28583 27.7098 6.94167 27.7084C6.125 27.7098 5.37396 27.2606 4.98896 26.5417C4.76 26.1188 4.67688 25.6317 4.75417 25.1563L6.05354 17.8792C6.05354 17.8631 6.04917 17.8471 6.0375 17.8354L0.641667 12.6438C0.231875 12.2442 0.00145833 11.6958 0 11.1227C0 10.519 0.242083 9.94 0.672292 9.51854C1.01208 9.21229 1.43208 9.01104 1.88271 8.93521L9.24729 7.87062C9.27646 7.87062 9.30708 7.8575 9.30708 7.82688L12.6 1.225C12.8596 0.701458 13.316 0.304792 13.8688 0.116667C14.0992 0.0379167 14.3413 0 14.5833 0Z';

  static const String graph =
      'M12.3926 6.94254C12.5205 7.19665 12.5973 7.47239 12.6194 7.75983L13.186 15.7639C13.1936 15.8735 13.2456 15.9757 13.3304 16.0478C13.394 16.1019 13.4722 16.1357 13.5596 16.1455L13.6499 16.1472L21.7789 15.6575C22.439 15.6187 23.0862 15.8484 23.5672 16.2923C24.0483 16.7362 24.3204 17.3548 24.3169 18.0705C23.9553 23.3387 20.0857 27.7428 14.8153 28.8844C9.54483 30.026 4.136 27.6316 1.54265 23.0196C0.849177 21.8306 0.38176 20.5301 0.165955 19.2134L0.0968725 18.719C0.0368992 18.3488 0.00465242 17.975 0 17.616L0.0045408 17.2625C0.0195392 11.7621 3.88144 7.00587 9.31597 5.723L9.68891 5.64094L9.88954 5.60775C10.9404 5.46409 11.9743 6.01494 12.3926 6.94254ZM10.2323 7.69728L10.1094 7.71125L9.77622 7.78653C5.44726 8.82988 2.34238 12.5567 2.16994 16.9473L2.16242 17.3047C2.15205 17.5766 2.16198 17.8488 2.19478 18.1384L2.23529 18.4345C2.38017 19.6803 2.78243 20.8842 3.42583 21.9876C5.56547 25.7926 10.0139 27.7618 14.3485 26.8229C18.6832 25.8841 21.8657 22.2619 22.1606 17.9979C22.1606 17.9337 22.1337 17.8722 22.0859 17.8282C22.0541 17.7988 22.0149 17.7789 21.9734 17.7699L21.91 17.765L13.7944 18.2539C13.1095 18.3025 12.433 18.0822 11.9146 17.6417C11.3962 17.2011 11.0787 16.5767 11.0326 15.9104L10.4665 7.91316C10.4655 7.89991 10.4619 7.88698 10.437 7.8356C10.4001 7.75389 10.3199 7.70191 10.2323 7.69728ZM16.6585 0.00153174C22.9082 0.178309 28.15 4.66904 29.1527 10.7054L29.1667 10.8744L29.1634 11.1687C29.1283 11.6028 28.9534 12.0157 28.6627 12.3474C28.2977 12.7639 27.7779 13.0209 27.2107 13.0619L17.5194 13.6938C16.2772 13.764 15.2097 12.8408 15.1289 11.628L14.481 2.11332L14.4884 1.90014L14.5206 1.65993C14.607 1.23403 14.8289 0.844926 15.1557 0.548958C15.5661 0.177281 16.1108 -0.0195286 16.6585 0.00153174ZM16.6414 2.11315L17.2828 11.489C17.2866 11.5459 17.3367 11.5892 17.3854 11.5865L27.0058 10.9572L26.9579 10.6947C26.0046 5.95029 21.8924 2.42729 16.9586 2.12818L16.6414 2.11315Z';

  static const String profile =
      'M8.50218 18.6971C10.6077 18.5114 12.7253 18.5114 14.8308 18.6971L15.5031 18.754C16.4226 18.8446 17.3356 18.9866 18.2341 19.1784C20.5242 19.6502 22.1871 20.487 22.9232 22.0394C23.4701 23.1943 23.4701 24.5352 22.923 25.6906C22.185 27.2469 20.5006 28.0908 18.2512 28.5346L17.5696 28.6761C16.6587 28.8509 15.7401 28.9702 14.8277 29.0327C13.1154 29.1784 11.3952 29.205 9.73587 29.1137C9.55295 29.1137 9.43019 29.1131 9.32201 29.1106L9.11164 29.1027C8.85587 29.0896 8.62153 29.0628 8.52321 29.034C7.36876 28.9556 6.22199 28.7885 5.12188 28.5403L4.74872 28.4624C2.66558 27.9995 1.12286 27.1645 0.409263 25.6889C0.139007 25.1164 -0.000782462 24.4905 2.88706e-05 23.8623C-0.00231953 23.2295 0.138611 22.6044 0.418919 22.0206C1.16211 20.5279 2.9082 19.6297 5.09078 19.1801C6.22158 18.9378 7.36801 18.7759 8.50218 18.6971ZM14.6469 20.8002C12.6638 20.6253 10.6692 20.6253 8.66681 20.8017C7.61197 20.8751 6.5636 21.0232 5.52136 21.2465C3.90719 21.579 2.67305 22.2139 2.30592 22.9511C2.17073 23.2327 2.10109 23.5416 2.10224 23.8597C2.10185 24.1796 2.17242 24.4956 2.30454 24.7756C2.68212 25.5563 3.84669 26.1397 5.553 26.4742L6.06709 26.583C6.92808 26.7537 7.81483 26.8714 8.8003 26.9457C8.92476 26.9707 9.05905 26.9861 9.21839 26.9942L9.7924 27.0041C11.4114 27.0916 13.0345 27.0666 14.6673 26.9277C15.7196 26.8556 16.765 26.7038 17.8201 26.4684L18.1482 26.3989C19.6467 26.0591 20.6835 25.5031 21.0247 24.7835C21.3 24.2022 21.3 23.5273 21.025 22.9466C20.6598 22.1764 19.5054 21.5954 17.8043 21.245C16.7696 21.0241 15.7207 20.876 14.6654 20.8017L14.6469 20.8002ZM11.6729 0C15.9517 0 19.4204 3.48343 19.4204 7.78046C19.4204 12.0775 15.9517 15.5609 11.6729 15.5609C7.39414 15.5609 3.9255 12.0775 3.9255 7.78046C3.9255 3.48343 7.39414 0 11.6729 0ZM11.6729 2.11118C8.55517 2.11118 6.02772 4.64941 6.02772 7.78046C6.02772 10.9115 8.55517 13.4497 11.6729 13.4497C14.7907 13.4497 17.3181 10.9115 17.3181 7.78046C17.3181 4.64941 14.7907 2.11118 11.6729 2.11118Z';
}

// ─── Internal model ───────────────────────────────────────────────────────────

class _TabData {
  final String label;
  final String svgPath;

  const _TabData({required this.label, required this.svgPath});
}
