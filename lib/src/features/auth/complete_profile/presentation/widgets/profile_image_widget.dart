part of '../imports/imports.dart';

enum ProfileType { view, edit }
enum ImageType { network, file }

class ProfileImageWidget extends StatefulWidget {
  final String? profileImageUrl;
  final Function(File? image)? onSelectImage;
  final ProfileType profileType;
  final ImageType imageType;

  const ProfileImageWidget({super.key,
    this.profileType =  ProfileType.view,
    this.profileImageUrl,
    this.imageType = ImageType.file,
    this.onSelectImage,
  });

  const ProfileImageWidget.edit({
    super.key,
    this.onSelectImage
  }) : profileType = ProfileType.edit, imageType = ImageType.file, profileImageUrl = null;

  const ProfileImageWidget.view({super.key,
        this.profileImageUrl
      }) : profileType = ProfileType.view, imageType = ImageType.network, onSelectImage = null;

  @override
  State<ProfileImageWidget> createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {

  String? img;
  String? get _profileImageFromCache{
    if(CacheStorage.read('user') != null){
      UserData user = UserData.fromJson(jsonDecode(CacheStorage.read('user')));
      return user.image;
    }

    return null;
  }

  Future<void> selectImage()async {
    Helpers.checkPermission(
        PermissionProcessModel(
          permissionClient: PermissionClient.camera,
          onPermissionGranted: ()async => await confirmNewProfileImage(),
          onPermissionDenied: () => Go.back(),
        )
    );
  }

  File? profileImageFile;
  Future<void> confirmNewProfileImage()async{
    final File? newImage = await Helpers.getImageFromCameraOrDevice();
    if (newImage != null) {
      setState(() => profileImageFile = newImage);
      widget.onSelectImage!(profileImageFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryColor),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: CircleAvatar(
                radius: 40.sp,
                backgroundColor: AppColors.primaryColor,
                backgroundImage: widget.profileType == ProfileType.view?
                NetworkImage(widget.profileImageUrl?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWhh44XYTIGf3bDB6XHMysaZIL3uhsqTi8nA&s') :
                profileImageFile == null?
               _profileImageFromCache == null?
               const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWhh44XYTIGf3bDB6XHMysaZIL3uhsqTi8nA&s') :
               NetworkImage(_profileImageFromCache!) : FileImage(profileImageFile!)
              ),
            ),
          ),
        ),
        Visibility(
          visible: widget.profileType == ProfileType.edit,
          child: IconButton(
              onPressed: ()async => await selectImage(),
              icon: SvgPicture.asset(Assets.iconsCameraIcon)
          ),
        ),
      ],
    );
  }
}

// enum ProfileType { view, edit }
// enum ImageType { network, file }
//
// class ProfileImageWidget extends StatefulWidget {
//   final String? profileImageUrl;
//
//   final Function(File? image)? onSelectImage;
//   final ProfileType profileType;
//   final ImageType imageType;
//
//   const ProfileImageWidget({super.key,
//     this.profileType =  ProfileType.view,
//     this.profileImageUrl,
//     this.imageType = ImageType.file,
//     this.onSelectImage,
//   });
//
//   @override
//   State<ProfileImageWidget> createState() => _ProfileImageWidgetState();
// }
//
// class _ProfileImageWidgetState extends State<ProfileImageWidget> {
//
//   String? img;
//   String? get _profileImageFromCache{
//     if(CacheStorage.read('user') != null){
//       UserData user = UserData.fromJson(jsonDecode(CacheStorage.read('user')));
//       return user.image;
//     }
//
//     return null;
//   }
//
//   Future<void> selectImage()async {
//     Helpers.checkPermission(
//         PermissionProcessModel(
//             permissionClient: PermissionClient.camera,
//             onPermissionGranted: ()async => await confirmNewProfileImage(),
//             onPermissionDenied: () => Go.back(),
//         )
//     );
//   }
//
//   File? profileImageFile;
//   Future<void> confirmNewProfileImage()async{
//     final File? newImage = await Helpers.getImageFromCameraOrDevice();
//     if (newImage != null) {
//       setState(() => profileImageFile = newImage);
//       widget.onSelectImage!(profileImageFile);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.bottomRight,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(16),
//           child: Container(
//             decoration: BoxDecoration(
//               border: Border.all(color: AppColors.primaryColor),
//               shape: BoxShape.circle,
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(5),
//               child: CircleAvatar(
//                 radius: 40.sp,
//                 backgroundColor: AppColors.primaryColor,
//                 backgroundImage: profileImageFile == null?
//                 NetworkImage(_profileImageFromCache?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWhh44XYTIGf3bDB6XHMysaZIL3uhsqTi8nA&s') :
//                 FileImage(profileImageFile!),
//               ),
//             ),
//           ),
//         ),
//         Visibility(
//           visible: widget.profileType == ProfileType.edit,
//           child: IconButton(
//               onPressed: ()async => await selectImage(),
//               icon: SvgPicture.asset(Assets.iconsCameraIcon)
//           ),
//         ),
//       ],
//     );
//   }
// }