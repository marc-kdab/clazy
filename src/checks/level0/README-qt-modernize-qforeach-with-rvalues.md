# qt-modernize-qforeach-with-rvalues

Warns when a `Q_FOREACH` or `foreach` loop is used to traverse an rvalue
container. Using a C++ ranged for-loop is just as safe and more efficient,
but, for CoW containers, requires to store the container in a const lvalue,
and iterate over that, to avoid detaches.

Example:

    QVariant v = ...;
    Q_FOREACH(const QString &string, v.toStringList())
        use(string);

better written as:

    const auto strings = v.toStringList();
    for (const QString &string : strings)
        use(string);
