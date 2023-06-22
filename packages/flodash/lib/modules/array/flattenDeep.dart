List flattenDeep(Iterable<dynamic> list) => [
      for (var element in list)
        if (element is! Iterable) element else ...flattenDeep(element),
    ];
