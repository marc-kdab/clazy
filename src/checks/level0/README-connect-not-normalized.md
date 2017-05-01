# connect-not-normalized

Warns when the contents of `SIGNAL()`, `SLOT()`, `Q_ARG()` and `Q_RETURN_ARG()` are not normalized.

For signals and slots only warns for `connect` statements, not `disconnect`, since it only
impacts the performance of the former.
