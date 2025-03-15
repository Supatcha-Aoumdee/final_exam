import 'package:flutter/material.dart';

class Answer2 extends StatefulWidget {
  const Answer2({super.key});

  @override
  State<Answer2> createState() => _RegisterState();
}

class _RegisterState extends State<Answer2> {
  final TextEditingController _weight = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String? _Narmal;
  String? _fast;
  String? _veryfast;
  String? _selected;
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('คำนวนค่าจัดส่ง')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('น้ำหนักสินค้า(กก.):',
                    style: TextStyle(fontSize: 14)),
                TextFormField(
                  controller: _weight,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกน้ำหนักสินค้า';
                    }
                    return null;
                  },
                ),
                const Text('เลือกระยะทาง:', style: TextStyle(fontSize: 14)),
                DropdownButtonFormField<String>(
                  value: _selected,
                  items: ['ในเมือง', 'ต่างจังหวัด', 'ต่างประเทศ']
                      .map((item) =>
                          DropdownMenuItem(value: item, child: Text(item)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selected = value;
                    });
                  },
                  validator: (value) =>
                      value == null ? 'กรุณาเลือกระยะทาง' : null,
                ),
                const SizedBox(height: 16),
                const Text('บริการเสริม:', style: TextStyle(fontSize: 14)),
                CheckboxListTile(
                  title: const Text('แพ็คกิ้งพิเศษ (+20 บาท)'),
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('ประกันพัสดุ (+50 บาท)'),
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                const Text('เลือกความเร่งด่วน:',
                    style: TextStyle(fontSize: 14)),
                Column(children: [
                  RadioListTile(
                    title: const Text('ปกติ'),
                    value: 'ปกติ',
                    groupValue: _Narmal,
                    onChanged: (value) {
                      setState(() {
                        _Narmal = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('ด่วน'),
                    value: 'ด่วน',
                    groupValue: _fast,
                    onChanged: (value) {
                      setState(() {
                        _fast = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('ด่วนพิเศษ'),
                    value: 'ด่วนพิเศษ',
                    groupValue: _veryfast,
                    onChanged: (value) {
                      setState(() {
                        _veryfast = value.toString();
                      });
                    },
                  ),
                ]),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate() && _isChecked) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('คำนวณสำเร็จ')),
                        );
                      }
                    },
                    child: const Text('คำนวณราคา'),
                  ),
                ),
                const SizedBox(height: 16),
                const Text('ค่าจัดส่งทั้งหมด: ฿0.0',
                    style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
