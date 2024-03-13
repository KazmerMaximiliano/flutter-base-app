import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutterbaseapp/core/globals/colors/smartzone_colors.dart';

class SzIcons {
  // menu
  static const IconData home = FontAwesomeIcons.lightHouse;
  static const IconData homeSelected = FontAwesomeIcons.solidHouse;
  static const IconData mensajes = FontAwesomeIcons.lightComments;
  static const IconData mensajesSelected = FontAwesomeIcons.solidComments;
  static const IconData amigos = FontAwesomeIcons.lightUserGroup;
  static const IconData amigosSelected = FontAwesomeIcons.solidUserGroup;
  static const IconData notifs = FontAwesomeIcons.lightBell;
  static const IconData notifsSelected = FontAwesomeIcons.solidBell;
  static const IconData user = FontAwesomeIcons.lightCircleUser;

  // profile
  static const IconData sobreMi = FontAwesomeIcons.solidUserLarge;
  static const IconData misRedes = FontAwesomeIcons.solidShare;
  static const IconData tyc = FontAwesomeIcons.solidShieldCheck;
  static const IconData reglas = FontAwesomeIcons.solidGroupArrowsRotate;
  static const IconData politicasPriv = FontAwesomeIcons.solidScaleBalanced;
  static const IconData ayudaYasist = FontAwesomeIcons.solidCircleInfo;
  static const IconData contactanos = FontAwesomeIcons.solidHeadset;

  // camara
  static const IconData camera = FontAwesomeIcons.lightCamera;
  static const IconData flash = FontAwesomeIcons.lightFlashlight;

  // info acerca de sz / sz header
  static const IconData ingLibre = FontAwesomeIcons.lightLockOpen;
  static const IconData ingQr = FontAwesomeIcons.lightQrcode;
  static const IconData phone = FontAwesomeIcons.lightMobile;
  static const IconData clock = FontAwesomeIcons.lightClock;
  static const IconData info = FontAwesomeIcons.lightCircleInfo;
  static const IconData filter = FontAwesomeIcons.lightBarsFilter;
  static const IconData szGallery = FontAwesomeIcons.lightCircleDashed;

  // acciones para el usuario
  static const IconData touch = FontAwesomeIcons.lightHandBackPointRight;
  static const IconData touchEmpty = FontAwesomeIcons.thinHandBackPointRight;
  static const IconData touchUsed = FontAwesomeIcons.solidHandBackPointRight;
  static const IconData touchMirror = FontAwesomeIcons.lightHandBackPointLeft;
  static const IconData chat = FontAwesomeIcons.lightCommentDots;
  static const IconData more = FontAwesomeIcons.lightEllipsisVertical;
  static const IconData blockUser = FontAwesomeIcons.lightUserLargeSlash;

  // messenger
  static const IconData check = FontAwesomeIcons.lightCheck;
  static const IconData circleCheck = FontAwesomeIcons.lightCircleCheck;
  static const IconData checkDouble = FontAwesomeIcons.lightCheckDouble;
  // otros
  static const IconData delete = FontAwesomeIcons.lightTrashCan;
  static const IconData back = FontAwesomeIcons.lightAngleLeft;
  static const IconData report = FontAwesomeIcons.thinMessageExclamation;
  static const IconData location = FontAwesomeIcons.lightLocationDot;
  static const IconData locationSolid = FontAwesomeIcons.solidLocationDot;
  static const IconData users = FontAwesomeIcons.lightUsers;
  static const IconData buscar = FontAwesomeIcons.lightMagnifyingGlass;
  static const IconData usersCheck = FontAwesomeIcons.thinUserCheck;

  // emptyss
  static const IconData usersAdd = FontAwesomeIcons.thinUserPlus;
  static const IconData commentDots = FontAwesomeIcons.thinCommentDots;
  static const IconData userGroup = FontAwesomeIcons.thinUserGroup;
  static const IconData notifsBellOn = FontAwesomeIcons.thinBellOn;
  // popups
  static const IconData block = FontAwesomeIcons.thinEyeSlash;
  static const IconData disblock = FontAwesomeIcons.thinUserCheck;
  static const IconData logOut = FontAwesomeIcons.thinArrowRightToBracket;
  static const IconData streetView = FontAwesomeIcons.thinStreetView;

  // static const IconData aaa = FontAwesomeIcons.aAa;
}

class SzIcon extends StatelessWidget {
  const SzIcon(this.szIcon, {Key? key, this.size, this.color}) : super(key: key);
  final double? size;
  final IconData szIcon;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return FaIcon(
      szIcon,
      size: size ?? 25,
      color: color ?? SzColors.greys.black,
    );
  }
}
