set proj_dir (dirname (realpath (status filename)))
set llvm_install $proj_dir/../official-llvm/install

. .py313/bin/activate.fish

set -x PATH $llvm_install/bin $PATH
set -x PYTHONPATH $proj_dir/python $PYTHONPATH
