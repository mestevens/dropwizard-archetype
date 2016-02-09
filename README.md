# How to use

If you need to set the script as executable, run:

```
chmod +x create.sh
```
then simply run the script and fill in the fields it asks for:

```
./create.sh
```

You can also provide the fields directly from the command line:

```
./create.sh <groupId> <artifactId> <name> <package>
```

For example:

```
./create.sh com.test hello-dropwizard HelloDW com.test.dropwizard
```