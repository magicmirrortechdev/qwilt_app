import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qwilt/src/providers/providers.dart';
import 'package:qwilt/src/ui/input_styles.dart';
import 'package:qwilt/src/widgets/card_container.dart';
import 'package:qwilt/src/widgets/widgets.dart';

class PortfolioAddScreen extends StatelessWidget {
  const PortfolioAddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Add Portfolio",
        ),
      ),
      body: Stack(children: <Widget>[
        const BackgroundApp(),
        Column(children: [
          SizedBox(
            height: 100,
          ),
          CardContainer(
              child: Column(
            children: [
              ChangeNotifierProvider(
                create: (_) => PortfolioFormProvider(),
                child: _AddPorfolioForm(),
              ),
              TextButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, 'portfolios'),
                  child: Text("Add Portfolio",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)))
            ],
          ))
        ])
      ]),
    );
  }
}

class _AddPorfolioForm extends StatefulWidget {
  @override
  __AddPorfolioFormState createState() => __AddPorfolioFormState();
}

class __AddPorfolioFormState extends State<_AddPorfolioForm> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  String? _fileName;
  String? _saveAsFileName;
  List<PlatformFile>? _paths;
  String? _directoryPath;
  String? _extension;
  bool _isLoading = false;
  bool _userAborted = false;
  bool _multiPick = false;
  FileType _pickingType = FileType.any;
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final portfolioForm = Provider.of<PortfolioFormProvider>(context);

    return Container(
      child: Form(
        key: portfolioForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) => portfolioForm.nickname = value,
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: InputStyles.authInputDecoration(
                  hintText: 'Nickname', labelText: 'Nickname'),
              validator: (value) {
                return value.toString().isEmpty
                    ? 'Nickname must no be empty'
                    : null;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text('Owner'),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButton(
                    value: 'James Keck',
                    items: _getOptions(),
                    onChanged: (opt) {
                      print(opt);
                    },
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                _pickFiles();
              },
              child: Text('Add Docs'),
            )
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _getOptions() {
    List<DropdownMenuItem<String>> lista =
        <String>['James Keck'].map((String value) {
      return new DropdownMenuItem<String>(
        value: value,
        child: new Text(value),
      );
    }).toList();

    return lista;
  }

  void _pickFiles() async {
    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: _multiPick,
        onFileLoading: (FilePickerStatus status) => print(status),
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '').split(',')
            : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      _logException('Unsupported operation' + e.toString());
    } catch (e) {
      _logException(e.toString());
    }
    if (!mounted) return;
    setState(() {
      _isLoading = false;
      _fileName =
          _paths != null ? _paths!.map((e) => e.name).toString() : '...';
      _userAborted = _paths == null;
    });
  }

  void _logException(String message) {
    print(message);
    _scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    _scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
