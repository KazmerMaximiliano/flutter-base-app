import 'package:flutter/material.dart';
import 'package:flutterbaseapp/core/globals/globals.dart';
import 'package:flutterbaseapp/core/globals/widgets/buttons/elevated_sz_button.dart';
import 'package:flutterbaseapp/features/data/models/user_model.dart';
// import 'package:flutterbaseapp/models/user/smartzone_user.dart';
// import 'package:flutterbaseapp/services/connection/friendships_service.dart';

class AddFriendButton extends StatefulWidget {
  const AddFriendButton({super.key, required this.user});

  // final SmartzoneUser user;
  final UserModel user;

  @override
  State<AddFriendButton> createState() => _AddFriendButtonState();
}

class _AddFriendButtonState extends State<AddFriendButton> {
  @override
  Widget build(BuildContext context) {
    final buttonsParams = _ButtonParams.fromParams(
      // friendshipStatus: widget.user.friendshipStatus,
      friendshipStatus: "",
      // adresserId: widget.user.adresserId,
      adresserId: 0,
      userId: widget.user.id,
    );

    return ElevatedSzButton(
      title: buttonsParams.title,
      textColor: buttonsParams.fontColor,
      color: buttonsParams.buttonColor,
      withBorder: buttonsParams.withBorder,
      borderColor: buttonsParams.borderColor,
      onPressed: () {
        /* final friendshipService = FriendshipService();

        if (widget.user.friendshipStatus == 'pending') {
          if (widget.user.adresserId != null) {
            friendshipService.acceptFriendRequest(
              friendshipRequester: widget.user.id,
            );
            widget.user.friendshipStatus = 'accepted';
          }
        } else if (widget.user.friendshipStatus != 'accepted') {
          friendshipService.sendFriendRequest(widget.user.id);
          widget.user.friendshipStatus = 'pending';
        } */

        setState(() {});
      },
    );
  }
}

class _ButtonParams {
  final String title;
  final Color fontColor;
  final Color buttonColor;
  final bool withBorder;
  final Color? borderColor;

  _ButtonParams({
    required this.title,
    required this.fontColor,
    required this.buttonColor,
    this.withBorder = false,
    this.borderColor,
  });

  factory _ButtonParams.fromParams({
    required String friendshipStatus,
    required int? adresserId,
    required int? userId,
  }) {
    if (friendshipStatus == 'pending') {
      if (adresserId != null && userId != null && adresserId != userId) {
        return _ButtonParams(
          title: "Aceptar",
          fontColor: SzColors.pasteles.red,
          buttonColor: SzColors.pasteles.white,
          withBorder: true,
          borderColor: SzColors.pasteles.red,
        );
      } else {
        return _ButtonParams(
          title: "Solicitud enviada",
          fontColor: SzColors.greys.black,
          buttonColor: SzColors.greys.greyF5,
          withBorder: false,
        );
      }
    } else if (friendshipStatus == 'accepted') {
      return _ButtonParams(
        title: "Ya son amigos",
        fontColor: SzColors.greys.black,
        buttonColor: SzColors.greys.greyF5,
        withBorder: false,
      );
    } else {
      return _ButtonParams(
        title: "Agregar",
        fontColor: Colors.white,
        buttonColor: SzColors.pasteles.red,
        withBorder: false,
      );
    }
  }
}
