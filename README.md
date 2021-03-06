**[MPIRUN](https://github.com/vladisalv/MPIRUN/blob/master/MPIRUN?raw=true)** - wrap for popular scheduling system on cluster or supercomputer.

## Overview

MPIRUN was started for unification interface to scheduling systems. Actually, this is wrap for popular scheduling systems and custom user's systems. You can determine your own system and use it. Script just input arguments and put it to scheduling systems command line without any processing.

### Custom scheduling systems

For adding your own system change $HOME/.MPIRUNrc file or specify it through `--file` option. File has the following structure:

```bash
USER_SYSTEMS="system1 system2 ..."

function set_system1 {
}
```
In function `set_YOURSYSTEM` define next variable:

```bash
LAUNCH=<command for submit your task>
QUEUE=<command for watching queue your task>
CANCEL=<command for cancel task>
NTASKS=<option for specifying number of process>
PARTITION=<if your system has partition of tasks>
TIME=<option time limit for task>
STDIN=<option for redirection stdin>
STDOUT=<option for redirection stdout>
STDERR=<option for redirection stderr>
ARGUMENTS=<option if you need pick out option of launch program>
TASKID=<option for specifying task id>
USR=<option for specifying user name>
```

Below example of MPIRUNrc for mpisubmit system (light version of loadlever):

```bash
USER_SYSTEMS="mpisubmit"

function set_mpisubmit {
    echo -n "You use mpisubmit: "
    LAUNCH=mpisubmit
    QUEUE=llq
    CANCEL=llcancel
    NTASKS="${_NTASKS:+"--nproc=$_NTASKS"}"
    PARTITION=
    TIME="${_TIME:+"--wtime=$_TIME"}"
    STDIN="${_STDIN:+"--stdin=$_STDIN"}"
    STDOUT="${_STDOUT:+"--stdout=$_STDOUT"}"
    STDERR="${_STDERR:+"--stderr=$_STDERR"}"
    ARGUMENTS="${_ARGUMENTS:+"-- $_ARGUMENTS"}"
    TASKID="${_TASKID:+"$_TASKID"}"
    USR="${_USER:+"-u $_USER"}"
}
```

### Web Page

https://github.com/vladisalv/MPIRUN

### Bug Reports

For bug report send a description of the problem to [Vladislav Toigildin](mailto:Vladislav.Toigildin@cs.msu.su)
