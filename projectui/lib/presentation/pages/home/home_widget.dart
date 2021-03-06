import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

import 'package:image_picker/image_picker.dart';
import 'package:projectui/dataprovider/plants.dart';
import 'package:projectui/presentation/pages/announcement/announce.dart';
var recommendations =
{
  "Apple scab": [ "Choose resistant varieties when possible.", "Destroy infected leaves to reduce the number of fungal spores available to start the disease cycle over again next spring.", "Water in the evening or early morning hours (avoid overhead irrigation) to give the leaves time to dry out before infection can occur.", "Spread a 75- to 150-inch layer of compost under trees, keeping it away from the trunk, to cover soil and prevent splash dispersal of the fungal spores.", "For best control, spray liquid copper fungicide when disease first appears, and repeat at 7 to 10 day intervals up to blossom drop." ],
  "Black rot in apple": [ "Prune out dead or diseased branches.", "Pick all dried and shriveled fruits remaining on the trees.", "Remove infected plant material from the area.", "Be sure to remove the stumps of any apple trees you cut down. Dead stumps can be a source of spores.", "Captan and sulfur products are labeled for control of both scab and black rot. These chemicals help to prevent the frog-eye leaf spot of black rot" ],
  "Cedar apple rust": [ "Dispose fallen leaves and other debris from under apple trees.", "Remove galls from infected apple trees. If infection appears in large scale, the entire plant should be removed fast.", "Spray plants with a copper fungicide at least four times between late August and late October.", "Choose resistant variety during cultivation by selective breeding." ],
  "Powdery mildew in cherry": [ "Prune plants to improve air circulation. Make sure to disinfect your pruning tools after each cut.", "Remove diseased foliage from the plant and clean up fallen debris on the ground.", "Use a thick layer of mulch or organic compost to cover the soil after you have raked and cleaned it well.", "Milk sprays, made with 40% milk and 60% water, are an effective home remedy for use on a wide range of plants. For best results, spray plant leaves as a preventative measure every 10-14 days.", "Water in the morning, so plants have a chance to dry during the day." ],
  "Cercospora gray leaf spot in maize": [ "Fungicides, if sprayed early in season before initial damage, can be effective in reducing disease.", "Use crop rotation and plant resistant corn hybrids." ],
  "Common rust in maize": [ "The best management option is growing corn products with higher levels of tolerance to common rust. General plant tolerance reduces the number and size of pustules and the overall severity of infection.", "Fungicides can effectively control common rust if initial applications are made while there are only a few pustules present per leaf.", "Fields should be examined every four weeks from whorl through dent stage." ],
  "Northern leaf blight in maize": [ "Fungicide sprays are recommended with a recommended spray schedule starting when the first lesions appear on the leaf below the earleaf on 50% of the plants.", "A combination of rotating away from corn for one year followed by tillage is recommended to prevent the development of northern leaf blight in maize." ],
  "Black rot in grape leaves": [ "Probiotic sprays, plant defence-enhancing sprays or sprays containing antagonistic bacteria such as Bacillus spp are successful in controlling black rot.", "Apply a fungicide every 14 days after the 'New Shoot' spray up to and including the ' Before Ripening' spray." ],
  "Black measles in grape": [ "It is advisable to scout fields and monitor for range of temperatures that bring on infection.", "Lime sulfur sprays manage the trio of pathogens that cause black measles." ],
  "Isariopsis leaf spot in grape": [ "Look for presence of lesions on spurs in areas in the vineyard exhibiting poor budbreak.", "A treatment of liquid lime sulfur at 10 gallons per acre in 100 gallons of water before rainfall in winter will reduce the viability of the desease.", "Spring foliar treatments are advisable if rainfall is predicted after budbreak.", "Apply materials before the first rain after budbreakand before 0.5 inch shoot length " ],
  "Haunglongbing(Citrus greening in orange)": [ "Apply antimicrobial peptide on infected part if possible", "Isolation and protection of budwood sources and plant propagation in screened-in, insect-proof locations is mandatory.", "Rapid removal of infected part is the very basic way to stop the spread of the bacteria responsible." ],
  "Bacterial spot in peach": [ "Compounds available for use on peach and nectarine for bacterial spot include copper, oxytetracycline, and syllit+captan; however, repeated applications are typically necessary for even minimal disease control.", "Another strategy is to establish sod strips between trees and to use gravel or other dust-suppressing methods on nearby dirt roads." ],
  "Bacterial spot in pepper": [ "Minimize overwatering and handle seedlings when they are wet.", "Do not spray, tie, harvest, or handle wet plants as that can spread the disease.", "Eliminate solanaceous weeds in and around tomato and pepper production areas.", "Avoid fields that have been planted with peppers within one year, especially if they had bacterial spot previously.", "Treat seeds with dilute bleach, hydrochloric acid, or hot water to reduce the potential for seedling infection." ],
  "Early blight in potato": [ "Early blight can be minimized by maintaining optimum growing conditions, including proper fertilization, irrigation, and management of other pests.", "Burn or bag infected plant parts. Do not use it as organic compost.", "Prune or stake plants to improve air circulation and reduce fungal problems.", "Keep the soil under plants clean and free of garden debris. Add a layer of organic compost to prevent the spores from splashing back up onto vegetation.", "For best control, apply copper-based fungicides early, two weeks before disease normally appears or when weather forecasts predict a long period of wet weather." ],
  "Late blight in potato": [ "Eliminate cull piles and volunteer potatoes.", "Use proper harvesting and storage practices.", "The severe late blight can be effectively managed with prophylactic spray of mancozeb at 0.25% followed by cymoxanil+mancozeb or dimethomorph+mancozeb at 0.3% at the onset of disease and one more spray of mancozeb at 0.25% seven days after application of systemic fungicides." ],
  "Powdery mildew in squash": [ "A better treatment solution for your squash plants, that is readily available in your home is baking soda.", "Mix 1 tablespoon baking soda with 1 tablespoon vegetable oil and 1 teaspoon dish soap in 1 gallon of water and apply.", "To keep the fungi from developing a resistance to your homemade spray, it is recommended that you alternate remedies each week.", "If problem persists, the best fungicide to control powdery mildew is Patch Pro. " ],
  "Leaf scorch in strawberry": [ "Remove infected leaves and debris fast.", "Increase air circulation to encourage leaf drying.", " To help prevent fungal disease persisting throughout the growing season, spray the strawberry plants every 10 days to two week with Bordeaux mix, sulfur or neem oil." ],
  "Bacterial spot in tomato": [ " Burn, bury or hot compost the affected plants and donot eat symptomatic fruit.", "Minimize overwatering and handle seedlings when they are wet.", "Do not spray, tie, harvest, or handle wet plants as that can spread the disease.", "Eliminate solanaceous weeds in and around tomato and pepper production areas.", "Avoid fields that have been planted with peppers within one year, especially if they had bacterial spot previously.", "Treat seeds with dilute bleach, hydrochloric acid, or hot water to reduce the potential for seedling infection." ],
  "Early blight in tomato": [ "Cover the soil under the plants with mulch, such as fabric, straw, plastic mulch, or dried leaves.", "Water at the base of each plant, using drip irrigation, a soaker hose, or careful hand watering.", "Pruning the bottom leaves can also prevent early blight spores from splashing up from the soil onto leaves." ],
  "Late blight in tomato": [ "Stake or cage tomato plants so that foliage grows vertically, off the ground.", "Mulch well around plants.", "When watering, use a soaker hose rather than an overhead sprinkler.", "Fungicides that contain maneb, mancozeb, chlorothanolil, or fixed copper can help protect plants from late tomato blight.", "Repeated applications are necessary throughout the growing season as the disease can strike at any time." ],
  "Tomato leaf mold": [ "Use drip irrigation and avoid watering foliage.", "Prune the plant to keep it upstanding and increase airflow in and around it.", "Remove and destroy (burn) all plants debris after the harvest.", "Calcium chloride-based sprays are recommended for treating leaf mold issues." ],
  "Septoria leaf spot in tomato": [ "Remove or destroy tomato debris by deep plowing immediately after harvest. A 1-year rotation out of tomato should be sufficient if no other sources of inoculum are available. Make sure perennial weed hosts such as horsenettle are eliminated before planting.", "Fungicides as maneb, mancozeb, chlorothalonil, and benomyl effectively control Septoria leaf spot on tomato plants.", "Because seed has been implicated as a source, make sure seed is acquired from disease-free seed-producing areas" ],
  "Two-spotted spider mite in tomato": [ "You should start treating for two-spotted mites before your plants are seriously damaged.", "The best way to begin treating for two-spotted mites is to apply a pesticide specific to mites called a miticide.", "Apply the miticide for control of two-spotted mites every 7 days or so." ],
  "Tomato target spot": [ "Remove old plant debris at the end of the growing season; otherwise, the spores will travel from debris to newly planted tomatoes in the following growing season.", "The fungicides to use are chlorothalonil, copper oxychloride or mancozeb. Treatment should start when the first spots are seen and continue at 10-14-day intervals until 3-4 weeks before last harvest." ],
  "Tomato yellow leaf curl virus": [ " If infections are beginning to appear, spray with azadirachtin (Neem), pyrethrin or insecticidal soap.", "For more effective control, it is recommended that at least two of the above insecticides be rotated at each spraying.", "As long as there are other growing points remaining, the plant can recover, and the leaf curling will only be a temporary observation." ],
  "Mosaic virus affecting tomato": [ "Once plants are infected, there is no cure for mosaic viruses.", "In order to prevent spread, destroy  all infected plants and any seedlings that appear stunted or distorted", "Decontaminate all tools and hands that come in contact." ]
};
class HomePage extends StatefulWidget {
  static const String routeName = "/home";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

final ImagePicker? _image = ImagePicker();
bool isImageUploaded = false;
String? res ='';
dynamic image;
var med;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    res = '';
  }
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: () {
          Navigator.of(context).pushNamed(Announce.routeName);
        }, icon: const Icon(Icons.announcement))
      ]),
      body: ListView(children: [
        SizedBox(
          height: 200,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.green,
                boxShadow: [BoxShadow(color: Colors.black)]),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(50, 50, 0, 0),
              child: Text(
                "Welcome " + args,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: GestureDetector(
              onTap: () {
                _showPicker();
              },
              child: isImageUploaded
                  ? Container(
                      width: double.infinity,
                      height: 200.0,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(
                                File(
                                  image.path,
                                ),
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(75.0)),
                            boxShadow: const [
                              BoxShadow(blurRadius: 7.0, color: Colors.black)
                            ]),
                      ),
                    )
                  : Container(
                      width: double.infinity,
                      height: 200.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.add_a_photo_outlined,
                            size: 100.0,
                          ),
                          Text("Add plant image"),
                        ],
                      ),
                    )),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
              padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
            ),
            onPressed: () async {
              // Validate returns true if the form is valid, or false otherwise.
              
                PlantProvider plantProvider = PlantProvider(httpClient: http.Client());
                var response = await plantProvider.predict(image: image);
                setState(() {
                  res = response;
                });
                med = recommendations[res];
                print(med);
                
                
            },
            child: const Text(
              'Check Disease',
              style: TextStyle(color: Colors.white),
            ),
          ),
          
        ),
        // const SizedBox(
          
        //   child: Padding(
        //     padding: EdgeInsets.all(8.0),
        //     child: SizedBox(
        //       height:50,
        //       width: 50,
        //       child: CircularProgressIndicator(
        //         value: 10,
        //         backgroundColor: Color(0xff000000),
        //                       valueColor:
        //                           AlwaysStoppedAnimation<Color>(Colors.green)),
        //     ),
        //   ),
        // ),
       Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
              children:[
                Text(res!, style: TextStyle(fontSize: 20),),
              ]
          ),
        ),
        Padding(
                  padding: const EdgeInsets.fromLTRB(18.0,8,0,8),
                  child: Text("Recommendations", style: TextStyle(fontSize: 17),),
                ),
        Padding(
                  padding: const EdgeInsets.fromLTRB(18.0,8,0,8),
                  child: Text(med==null ? "There no medication":med[0]),
                ),
              //   med ==null ? Text("There no medication") :
              //  ListView.builder(
              //    itemCount: med.length,
              //    itemBuilder: (ctx,index){
              //      print(med.length);
              //    return ListTile(title: Text(med[index],style: TextStyle(fontSize: 17),),);
              //  })

      ]),
    );
  }

  dynamic _showPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: [
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Photo Library'),
                  onTap: () async {
                    image =
                        await _image?.pickImage(source: ImageSource.gallery);
                    Navigator.of(context).pop();
                    setState(() {
                      isImageUploaded = true;
                    });
                  },
                ),
                ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Camera'),
                  onTap: () async {
                    image = await _image?.pickImage(source: ImageSource.camera);
                    Navigator.of(context).pop();
                    // print(image.path);
                    setState(() {
                      isImageUploaded = true;
                    });
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
    return image;
  }
}
