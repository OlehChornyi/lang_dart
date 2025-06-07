void main(List<String> args) {
  
}

//The Template Method pattern defines the skeleton of an algorithm 
//in a base class but lets subclasses override specific steps without 
//changing the algorithm’s structure. It's useful when you want to reuse 
//the structure but customize parts of the logic.

//13.1. Base Page Template with Custom Titles and Content
//Create a base widget that defines a common layout structure for all pages.
// abstract class BasePage {
//   String getTitle();
//   Widget buildBody();

//   Widget buildPage(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(getTitle())),
//       body: buildBody(),
//     );
//   }
// }

// class HomePage extends BasePage {
//   @override
//   String getTitle() => 'Home';

//   @override
//   Widget buildBody() {
//     return Center(child: Text('Welcome to the Home Page!'));
//   }
// }

// class AboutPage extends BasePage {
//   @override
//   String getTitle() => 'About';

//   @override
//   Widget buildBody() {
//     return Center(child: Text('About this app.'));
//   }
// }

//13.2. List Screen Template with Data and Item Builder
//Use a template to build a list UI with different data and item designs.
// abstract class ListScreenTemplate {
//   List<String> getItems();
//   Widget buildItem(BuildContext context, String item);

//   Widget buildScreen(BuildContext context) {
//     return ListView(
//       children: getItems().map((item) => buildItem(context, item)).toList(),
//     );
//   }
// }

// class ContactsScreen extends ListScreenTemplate {
//   @override
//   List<String> getItems() => ['Alice', 'Bob', 'Charlie'];

//   @override
//   Widget buildItem(BuildContext context, String item) {
//     return ListTile(title: Text(item), leading: Icon(Icons.person));
//   }
// }

//13.3. Form Screen Template
//Create a reusable form layout with varying fields.
// abstract class FormTemplate {
//   String getTitle();
//   List<Widget> buildFields();

//   Widget buildForm(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(getTitle())),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(children: buildFields()),
//       ),
//     );
//   }
// }

// class LoginForm extends FormTemplate {
//   @override
//   String getTitle() => 'Login';

//   @override
//   List<Widget> buildFields() {
//     return [
//       TextField(decoration: InputDecoration(labelText: 'Email')),
//       TextField(decoration: InputDecoration(labelText: 'Password')),
//     ];
//   }
// }

//13.4. API Loading Template Screen
//Define a structure for loading data from an API and displaying it.
// abstract class APITemplateScreen {
//   Future<List<String>> fetchData();
//   Widget buildList(List<String> data);

//   Widget build(BuildContext context) {
//     return FutureBuilder<List<String>>(
//       future: fetchData(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasData) {
//           return buildList(snapshot.data!);
//         } else {
//           return Center(child: Text("Error loading data"));
//         }
//       },
//     );
//   }
// }

// class NewsScreen extends APITemplateScreen {
//   @override
//   Future<List<String>> fetchData() async {
//     await Future.delayed(Duration(seconds: 1));
//     return ['News 1', 'News 2', 'News 3'];
//   }

//   @override
//   Widget buildList(List<String> data) {
//     return ListView(children: data.map((e) => ListTile(title: Text(e))).toList());
//   }
// }

//13.5. Dialog Template
//Create a template for dialogs with custom content.
// abstract class DialogTemplate {
//   String getTitle();
//   Widget buildContent(BuildContext context);

//   void show(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: Text(getTitle()),
//         content: buildContent(context),
//         actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text("Close"))],
//       ),
//     );
//   }
// }

// class InfoDialog extends DialogTemplate {
//   @override
//   String getTitle() => "Information";

//   @override
//   Widget buildContent(BuildContext context) {
//     return Text("This is an informational dialog.");
//   }
// }