import 'flatten.dart';
import 'uniq.dart';

import '../../_utils/_varargs.dart';

final union =
    VarargsFunction((arguments) => uniq(flatten(arguments))) as dynamic;
