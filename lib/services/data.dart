import 'package:Efficacy/models/club.dart';
import 'package:Efficacy/models/event.dart';

var eventList = [
  Event(id:"1", name: "Cloud Essentials", club: "DSC", date: "27 Sep", time: "19 : 00", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non tortor volutpat, molestie tellus vel, luctus elit. Sed hendrerit orci ante, ut venenatis sem cursus non. Etiam ullamcorper condimentum mattis. Etiam commodo dolor ut enim cursus, quis dapibus mi ultrices. Cras sollicitudin sit amet elit id aliquet. Suspendisse scelerisque ultricies vehicula. Curabitur posuere pellentesque maximus. Nulla facilisi."),
  Event(
      id:"2", 
      name: "Overfitting and Underfitting Class",
      club: "Machine Learning Club",
      date: "27 Sep",
      time: "8 : 00",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non tortor volutpat, molestie tellus vel, luctus elit. Sed hendrerit orci ante, ut venenatis sem cursus non. Etiam ullamcorper condimentum mattis. Etiam commodo dolor ut enim cursus, quis dapibus mi ultrices. Cras sollicitudin sit amet elit id aliquet. Suspendisse scelerisque ultricies vehicula. Curabitur posuere pellentesque maximus. Nulla facilisi."),
  Event(id:"3", name: "Parlare", club: "Illuminits", date: "27 Sep", time: "9 : 00", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non tortor volutpat, molestie tellus vel, luctus elit. Sed hendrerit orci ante, ut venenatis sem cursus non. Etiam ullamcorper condimentum mattis. Etiam commodo dolor ut enim cursus, quis dapibus mi ultrices. Cras sollicitudin sit amet elit id aliquet. Suspendisse scelerisque ultricies vehicula. Curabitur posuere pellentesque maximus. Nulla facilisi."),
  Event(
    id:"4", 
      name: "DSA Class", club: "Coding Club", date: "27 Sep", time: "11 : 00", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non tortor volutpat, molestie tellus vel, luctus elit. Sed hendrerit orci ante, ut venenatis sem cursus non. Etiam ullamcorper condimentum mattis. Etiam commodo dolor ut enim cursus, quis dapibus mi ultrices. Cras sollicitudin sit amet elit id aliquet. Suspendisse scelerisque ultricies vehicula. Curabitur posuere pellentesque maximus. Nulla facilisi."),
  Event(
    id:"5", 
      name: "Intro to Robotics",
      club: "NERDS",
      date: "27 Sep",
      time: "11 : 00",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non tortor volutpat, molestie tellus vel, luctus elit. Sed hendrerit orci ante, ut venenatis sem cursus non. Etiam ullamcorper condimentum mattis. Etiam commodo dolor ut enim cursus, quis dapibus mi ultrices. Cras sollicitudin sit amet elit id aliquet. Suspendisse scelerisque ultricies vehicula. Curabitur posuere pellentesque maximus. Nulla facilisi."),
  Event(
    id: "6", 
      name: "Linux Fundamentals",
      club: "DSC NITS",
      date: "27 Sep",
      time: "11 : 00",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non tortor volutpat, molestie tellus vel, luctus elit. Sed hendrerit orci ante, ut venenatis sem cursus non. Etiam ullamcorper condimentum mattis. Etiam commodo dolor ut enim cursus, quis dapibus mi ultrices. Cras sollicitudin sit amet elit id aliquet. Suspendisse scelerisque ultricies vehicula. Curabitur posuere pellentesque maximus. Nulla facilisi."),
  Event(id:"7", name: "QuaranTime", club: "Illuminits", date: "27 Sep", time: "11 : 00", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non tortor volutpat, molestie tellus vel, luctus elit. Sed hendrerit orci ante, ut venenatis sem cursus non. Etiam ullamcorper condimentum mattis. Etiam commodo dolor ut enim cursus, quis dapibus mi ultrices. Cras sollicitudin sit amet elit id aliquet. Suspendisse scelerisque ultricies vehicula. Curabitur posuere pellentesque maximus. Nulla facilisi."),
  Event(id:"8", name: "Recitation", club: "Illuminits", date: "29 Sep", time: "11 : 00", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non tortor volutpat, molestie tellus vel, luctus elit. Sed hendrerit orci ante, ut venenatis sem cursus non. Etiam ullamcorper condimentum mattis. Etiam commodo dolor ut enim cursus, quis dapibus mi ultrices. Cras sollicitudin sit amet elit id aliquet. Suspendisse scelerisque ultricies vehicula. Curabitur posuere pellentesque maximus. Nulla facilisi."),
  
];

var clubList = [
  Club(
      id: "i1",
      name: "Illuminits",
      desc:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non tortor volutpat, molestie tellus vel, luctus elit. Sed hendrerit orci ante, ut venenatis sem cursus non. Etiam ullamcorper condimentum mattis. Etiam commodo dolor ut enim cursus, quis dapibus mi ultrices. Cras sollicitudin sit amet elit id aliquet. Suspendisse scelerisque ultricies vehicula. Curabitur posuere pellentesque maximus. Nulla facilisi.",
      imageUrl: "assets/illuminits.jpg"),
  Club(
      id: "i2",
      name: "Machine Learning Club",
      desc:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non tortor volutpat, molestie tellus vel, luctus elit. Sed hendrerit orci ante, ut venenatis sem cursus non. Etiam ullamcorper condimentum mattis. Etiam commodo dolor ut enim cursus, quis dapibus mi ultrices. Cras sollicitudin sit amet elit id aliquet. Suspendisse scelerisque ultricies vehicula. Curabitur posuere pellentesque maximus. Nulla facilisi.",
      imageUrl: "assets/ml.png"),
  Club(
      id: "i3",
      name: "DSC NITS",
      desc:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non tortor volutpat, molestie tellus vel, luctus elit. Sed hendrerit orci ante, ut venenatis sem cursus non. Etiam ullamcorper condimentum mattis. Etiam commodo dolor ut enim cursus, quis dapibus mi ultrices. Cras sollicitudin sit amet elit id aliquet. Suspendisse scelerisque ultricies vehicula. Curabitur posuere pellentesque maximus. Nulla facilisi.",
      imageUrl: "assets/dsc.png"),
  Club(
      id: "i4",
      name: "NERDS",
      desc:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non tortor volutpat, molestie tellus vel, luctus elit. Sed hendrerit orci ante, ut venenatis sem cursus non. Etiam ullamcorper condimentum mattis. Etiam commodo dolor ut enim cursus, quis dapibus mi ultrices. Cras sollicitudin sit amet elit id aliquet. Suspendisse scelerisque ultricies vehicula. Curabitur posuere pellentesque maximus. Nulla facilisi.",
      imageUrl: "assets/nerds.png"),
  Club(
      id: "i5",
      name: "Coding Club",
      desc:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non tortor volutpat, molestie tellus vel, luctus elit. Sed hendrerit orci ante, ut venenatis sem cursus non. Etiam ullamcorper condimentum mattis. Etiam commodo dolor ut enim cursus, quis dapibus mi ultrices. Cras sollicitudin sit amet elit id aliquet. Suspendisse scelerisque ultricies vehicula. Curabitur posuere pellentesque maximus. Nulla facilisi.",
      imageUrl: "assets/coding.png"),
];
