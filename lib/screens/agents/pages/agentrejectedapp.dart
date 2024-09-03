import 'package:flutter/material.dart';

class AgentrejectedapplicantScreen extends StatefulWidget {
  const AgentrejectedapplicantScreen({super.key});
  static const pagename = '/agentnewapplicant';

  @override
  State<AgentrejectedapplicantScreen> createState() =>
      _AgentrejectedapplicantScreenState();
}

class _AgentrejectedapplicantScreenState
    extends State<AgentrejectedapplicantScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Ali Farax'),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.red,
                      ),
                      child: const Center(
                          child: Text(
                        'Rejected',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ],
                ),
                const Text('Civil Engineering'),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Adam ali'),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.red,
                      ),
                      child: const Center(
                          child: Text(
                        'Rejected',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ],
                ),
                const Text('Civil Engineering'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
