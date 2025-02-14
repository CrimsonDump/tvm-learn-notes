[toc]

# [原tvm README](./README_tvm.md)


# relax

## paper notes
[Relax: Composable Abstractions for End-to-End Dynamic Machine Learningpaper](https://arxiv.org/pdf/2311.02103)

### Language Constructs
annotation, dataflow block, function call
### Cross-level abstraction

relax (DAG style) ---call_tir/call_dps_library---> tir/library(DPS style)

### Simbolic shape & deduction
在推导效率和shape信息量之间找到平衡：

data-dependent shape : 插入match_cast，分配新符号，做runtime check。

高效推导：每个pass跑完都会自动做shape inference。

过程间shape关系：支持定义自定义子图或函数的输入输出shape关系，并支持caller能根据此作出正确的deduction。

子图传入额外符号：例如输入输出都是表达式，relax选择将所需的符号全部作为参数传进去，而不是分配一个新符号表达子表达式替换之类。
### fuse
FuseTensorIR就是在merge call_tir
### memory planning
内存复用，看看RequestReuseWithSymShape，确认可以复用的严格条件。
### Cross-Level Tensor Program Workspace Lifting
###  CUDA Graph Offloading


## IR

## pass

### fuse op

# TIR

## IR

## pass

# dynamic shape

## shape inference

## codegen

# backend & codegen



# runtime



# 底层设计

## functor & visitor & mutator

## object & 智能指针

## ffi & python绑定


