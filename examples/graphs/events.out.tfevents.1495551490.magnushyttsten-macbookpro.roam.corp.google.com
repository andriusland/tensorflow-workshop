       �K"	  ��I�Abrain.Event:2�6CS<      ���	���I�A"�x
[
input/x-inputPlaceholder*
dtype0*
shape: *#
_output_shapes
:���������
[
input/y-inputPlaceholder*
dtype0*
shape: *#
_output_shapes
:���������
c
model/random_normal/shapeConst*
dtype0*
valueB:*
_output_shapes
:
]
model/random_normal/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
_
model/random_normal/stddevConst*
dtype0*
valueB
 *  �?*
_output_shapes
: 
�
(model/random_normal/RandomStandardNormalRandomStandardNormalmodel/random_normal/shape*
dtype0*
seed2 *

seed *
T0*
_output_shapes
:
�
model/random_normal/mulMul(model/random_normal/RandomStandardNormalmodel/random_normal/stddev*
T0*
_output_shapes
:
r
model/random_normalAddmodel/random_normal/mulmodel/random_normal/mean*
T0*
_output_shapes
:
s
model/m
VariableV2*
dtype0*
shape:*
	container *
shared_name *
_output_shapes
:
�
model/m/AssignAssignmodel/mmodel/random_normal*
validate_shape(*
_class
loc:@model/m*
use_locking(*
T0*
_output_shapes
:
b
model/m/readIdentitymodel/m*
_class
loc:@model/m*
T0*
_output_shapes
:
e
model/random_normal_1/shapeConst*
dtype0*
valueB:*
_output_shapes
:
_
model/random_normal_1/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
a
model/random_normal_1/stddevConst*
dtype0*
valueB
 *  �?*
_output_shapes
: 
�
*model/random_normal_1/RandomStandardNormalRandomStandardNormalmodel/random_normal_1/shape*
dtype0*
seed2 *

seed *
T0*
_output_shapes
:
�
model/random_normal_1/mulMul*model/random_normal_1/RandomStandardNormalmodel/random_normal_1/stddev*
T0*
_output_shapes
:
x
model/random_normal_1Addmodel/random_normal_1/mulmodel/random_normal_1/mean*
T0*
_output_shapes
:
s
model/b
VariableV2*
dtype0*
shape:*
	container *
shared_name *
_output_shapes
:
�
model/b/AssignAssignmodel/bmodel/random_normal_1*
validate_shape(*
_class
loc:@model/b*
use_locking(*
T0*
_output_shapes
:
b
model/b/readIdentitymodel/b*
_class
loc:@model/b*
T0*
_output_shapes
:
[
	model/mulMulmodel/m/readinput/x-input*
T0*#
_output_shapes
:���������
W
	model/addAdd	model/mulmodel/b/read*
T0*#
_output_shapes
:���������
`
training/loss/subSub	model/addinput/y-input*
T0*#
_output_shapes
:���������
_
training/loss/SquareSquaretraining/loss/sub*
T0*#
_output_shapes
:���������
]
training/loss/ConstConst*
dtype0*
valueB: *
_output_shapes
:
�
training/loss/MeanMeantraining/loss/Squaretraining/loss/Const*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
e
"training/optimizer/gradients/ShapeConst*
dtype0*
valueB *
_output_shapes
: 
g
"training/optimizer/gradients/ConstConst*
dtype0*
valueB
 *  �?*
_output_shapes
: 
�
!training/optimizer/gradients/FillFill"training/optimizer/gradients/Shape"training/optimizer/gradients/Const*
T0*
_output_shapes
: 
�
Btraining/optimizer/gradients/training/loss/Mean_grad/Reshape/shapeConst*
dtype0*
valueB:*
_output_shapes
:
�
<training/optimizer/gradients/training/loss/Mean_grad/ReshapeReshape!training/optimizer/gradients/FillBtraining/optimizer/gradients/training/loss/Mean_grad/Reshape/shape*
_output_shapes
:*
T0*
Tshape0
�
:training/optimizer/gradients/training/loss/Mean_grad/ShapeShapetraining/loss/Square*
out_type0*
T0*
_output_shapes
:
�
9training/optimizer/gradients/training/loss/Mean_grad/TileTile<training/optimizer/gradients/training/loss/Mean_grad/Reshape:training/optimizer/gradients/training/loss/Mean_grad/Shape*

Tmultiples0*
T0*#
_output_shapes
:���������
�
<training/optimizer/gradients/training/loss/Mean_grad/Shape_1Shapetraining/loss/Square*
out_type0*
T0*
_output_shapes
:

<training/optimizer/gradients/training/loss/Mean_grad/Shape_2Const*
dtype0*
valueB *
_output_shapes
: 
�
:training/optimizer/gradients/training/loss/Mean_grad/ConstConst*
dtype0*
valueB: *
_output_shapes
:
�
9training/optimizer/gradients/training/loss/Mean_grad/ProdProd<training/optimizer/gradients/training/loss/Mean_grad/Shape_1:training/optimizer/gradients/training/loss/Mean_grad/Const*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
�
<training/optimizer/gradients/training/loss/Mean_grad/Const_1Const*
dtype0*
valueB: *
_output_shapes
:
�
;training/optimizer/gradients/training/loss/Mean_grad/Prod_1Prod<training/optimizer/gradients/training/loss/Mean_grad/Shape_2<training/optimizer/gradients/training/loss/Mean_grad/Const_1*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
�
>training/optimizer/gradients/training/loss/Mean_grad/Maximum/yConst*
dtype0*
value	B :*
_output_shapes
: 
�
<training/optimizer/gradients/training/loss/Mean_grad/MaximumMaximum;training/optimizer/gradients/training/loss/Mean_grad/Prod_1>training/optimizer/gradients/training/loss/Mean_grad/Maximum/y*
T0*
_output_shapes
: 
�
=training/optimizer/gradients/training/loss/Mean_grad/floordivFloorDiv9training/optimizer/gradients/training/loss/Mean_grad/Prod<training/optimizer/gradients/training/loss/Mean_grad/Maximum*
T0*
_output_shapes
: 
�
9training/optimizer/gradients/training/loss/Mean_grad/CastCast=training/optimizer/gradients/training/loss/Mean_grad/floordiv*

DstT0*

SrcT0*
_output_shapes
: 
�
<training/optimizer/gradients/training/loss/Mean_grad/truedivRealDiv9training/optimizer/gradients/training/loss/Mean_grad/Tile9training/optimizer/gradients/training/loss/Mean_grad/Cast*
T0*#
_output_shapes
:���������
�
<training/optimizer/gradients/training/loss/Square_grad/mul/xConst=^training/optimizer/gradients/training/loss/Mean_grad/truediv*
dtype0*
valueB
 *   @*
_output_shapes
: 
�
:training/optimizer/gradients/training/loss/Square_grad/mulMul<training/optimizer/gradients/training/loss/Square_grad/mul/xtraining/loss/sub*
T0*#
_output_shapes
:���������
�
<training/optimizer/gradients/training/loss/Square_grad/mul_1Mul<training/optimizer/gradients/training/loss/Mean_grad/truediv:training/optimizer/gradients/training/loss/Square_grad/mul*
T0*#
_output_shapes
:���������
�
9training/optimizer/gradients/training/loss/sub_grad/ShapeShape	model/add*
out_type0*
T0*
_output_shapes
:
�
;training/optimizer/gradients/training/loss/sub_grad/Shape_1Shapeinput/y-input*
out_type0*
T0*
_output_shapes
:
�
Itraining/optimizer/gradients/training/loss/sub_grad/BroadcastGradientArgsBroadcastGradientArgs9training/optimizer/gradients/training/loss/sub_grad/Shape;training/optimizer/gradients/training/loss/sub_grad/Shape_1*
T0*2
_output_shapes 
:���������:���������
�
7training/optimizer/gradients/training/loss/sub_grad/SumSum<training/optimizer/gradients/training/loss/Square_grad/mul_1Itraining/optimizer/gradients/training/loss/sub_grad/BroadcastGradientArgs*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
�
;training/optimizer/gradients/training/loss/sub_grad/ReshapeReshape7training/optimizer/gradients/training/loss/sub_grad/Sum9training/optimizer/gradients/training/loss/sub_grad/Shape*#
_output_shapes
:���������*
T0*
Tshape0
�
9training/optimizer/gradients/training/loss/sub_grad/Sum_1Sum<training/optimizer/gradients/training/loss/Square_grad/mul_1Ktraining/optimizer/gradients/training/loss/sub_grad/BroadcastGradientArgs:1*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
�
7training/optimizer/gradients/training/loss/sub_grad/NegNeg9training/optimizer/gradients/training/loss/sub_grad/Sum_1*
T0*
_output_shapes
:
�
=training/optimizer/gradients/training/loss/sub_grad/Reshape_1Reshape7training/optimizer/gradients/training/loss/sub_grad/Neg;training/optimizer/gradients/training/loss/sub_grad/Shape_1*#
_output_shapes
:���������*
T0*
Tshape0
�
Dtraining/optimizer/gradients/training/loss/sub_grad/tuple/group_depsNoOp<^training/optimizer/gradients/training/loss/sub_grad/Reshape>^training/optimizer/gradients/training/loss/sub_grad/Reshape_1
�
Ltraining/optimizer/gradients/training/loss/sub_grad/tuple/control_dependencyIdentity;training/optimizer/gradients/training/loss/sub_grad/ReshapeE^training/optimizer/gradients/training/loss/sub_grad/tuple/group_deps*N
_classD
B@loc:@training/optimizer/gradients/training/loss/sub_grad/Reshape*
T0*#
_output_shapes
:���������
�
Ntraining/optimizer/gradients/training/loss/sub_grad/tuple/control_dependency_1Identity=training/optimizer/gradients/training/loss/sub_grad/Reshape_1E^training/optimizer/gradients/training/loss/sub_grad/tuple/group_deps*P
_classF
DBloc:@training/optimizer/gradients/training/loss/sub_grad/Reshape_1*
T0*#
_output_shapes
:���������
z
1training/optimizer/gradients/model/add_grad/ShapeShape	model/mul*
out_type0*
T0*
_output_shapes
:
}
3training/optimizer/gradients/model/add_grad/Shape_1Const*
dtype0*
valueB:*
_output_shapes
:
�
Atraining/optimizer/gradients/model/add_grad/BroadcastGradientArgsBroadcastGradientArgs1training/optimizer/gradients/model/add_grad/Shape3training/optimizer/gradients/model/add_grad/Shape_1*
T0*2
_output_shapes 
:���������:���������
�
/training/optimizer/gradients/model/add_grad/SumSumLtraining/optimizer/gradients/training/loss/sub_grad/tuple/control_dependencyAtraining/optimizer/gradients/model/add_grad/BroadcastGradientArgs*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
�
3training/optimizer/gradients/model/add_grad/ReshapeReshape/training/optimizer/gradients/model/add_grad/Sum1training/optimizer/gradients/model/add_grad/Shape*#
_output_shapes
:���������*
T0*
Tshape0
�
1training/optimizer/gradients/model/add_grad/Sum_1SumLtraining/optimizer/gradients/training/loss/sub_grad/tuple/control_dependencyCtraining/optimizer/gradients/model/add_grad/BroadcastGradientArgs:1*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
�
5training/optimizer/gradients/model/add_grad/Reshape_1Reshape1training/optimizer/gradients/model/add_grad/Sum_13training/optimizer/gradients/model/add_grad/Shape_1*
_output_shapes
:*
T0*
Tshape0
�
<training/optimizer/gradients/model/add_grad/tuple/group_depsNoOp4^training/optimizer/gradients/model/add_grad/Reshape6^training/optimizer/gradients/model/add_grad/Reshape_1
�
Dtraining/optimizer/gradients/model/add_grad/tuple/control_dependencyIdentity3training/optimizer/gradients/model/add_grad/Reshape=^training/optimizer/gradients/model/add_grad/tuple/group_deps*F
_class<
:8loc:@training/optimizer/gradients/model/add_grad/Reshape*
T0*#
_output_shapes
:���������
�
Ftraining/optimizer/gradients/model/add_grad/tuple/control_dependency_1Identity5training/optimizer/gradients/model/add_grad/Reshape_1=^training/optimizer/gradients/model/add_grad/tuple/group_deps*H
_class>
<:loc:@training/optimizer/gradients/model/add_grad/Reshape_1*
T0*
_output_shapes
:
{
1training/optimizer/gradients/model/mul_grad/ShapeConst*
dtype0*
valueB:*
_output_shapes
:
�
3training/optimizer/gradients/model/mul_grad/Shape_1Shapeinput/x-input*
out_type0*
T0*
_output_shapes
:
�
Atraining/optimizer/gradients/model/mul_grad/BroadcastGradientArgsBroadcastGradientArgs1training/optimizer/gradients/model/mul_grad/Shape3training/optimizer/gradients/model/mul_grad/Shape_1*
T0*2
_output_shapes 
:���������:���������
�
/training/optimizer/gradients/model/mul_grad/mulMulDtraining/optimizer/gradients/model/add_grad/tuple/control_dependencyinput/x-input*
T0*#
_output_shapes
:���������
�
/training/optimizer/gradients/model/mul_grad/SumSum/training/optimizer/gradients/model/mul_grad/mulAtraining/optimizer/gradients/model/mul_grad/BroadcastGradientArgs*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
�
3training/optimizer/gradients/model/mul_grad/ReshapeReshape/training/optimizer/gradients/model/mul_grad/Sum1training/optimizer/gradients/model/mul_grad/Shape*
_output_shapes
:*
T0*
Tshape0
�
1training/optimizer/gradients/model/mul_grad/mul_1Mulmodel/m/readDtraining/optimizer/gradients/model/add_grad/tuple/control_dependency*
T0*#
_output_shapes
:���������
�
1training/optimizer/gradients/model/mul_grad/Sum_1Sum1training/optimizer/gradients/model/mul_grad/mul_1Ctraining/optimizer/gradients/model/mul_grad/BroadcastGradientArgs:1*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
�
5training/optimizer/gradients/model/mul_grad/Reshape_1Reshape1training/optimizer/gradients/model/mul_grad/Sum_13training/optimizer/gradients/model/mul_grad/Shape_1*#
_output_shapes
:���������*
T0*
Tshape0
�
<training/optimizer/gradients/model/mul_grad/tuple/group_depsNoOp4^training/optimizer/gradients/model/mul_grad/Reshape6^training/optimizer/gradients/model/mul_grad/Reshape_1
�
Dtraining/optimizer/gradients/model/mul_grad/tuple/control_dependencyIdentity3training/optimizer/gradients/model/mul_grad/Reshape=^training/optimizer/gradients/model/mul_grad/tuple/group_deps*F
_class<
:8loc:@training/optimizer/gradients/model/mul_grad/Reshape*
T0*
_output_shapes
:
�
Ftraining/optimizer/gradients/model/mul_grad/tuple/control_dependency_1Identity5training/optimizer/gradients/model/mul_grad/Reshape_1=^training/optimizer/gradients/model/mul_grad/tuple/group_deps*H
_class>
<:loc:@training/optimizer/gradients/model/mul_grad/Reshape_1*
T0*#
_output_shapes
:���������
u
0training/optimizer/GradientDescent/learning_rateConst*
dtype0*
valueB
 *   ?*
_output_shapes
: 
�
Ftraining/optimizer/GradientDescent/update_model/m/ApplyGradientDescentApplyGradientDescentmodel/m0training/optimizer/GradientDescent/learning_rateDtraining/optimizer/gradients/model/mul_grad/tuple/control_dependency*
_class
loc:@model/m*
use_locking( *
T0*
_output_shapes
:
�
Ftraining/optimizer/GradientDescent/update_model/b/ApplyGradientDescentApplyGradientDescentmodel/b0training/optimizer/GradientDescent/learning_rateFtraining/optimizer/gradients/model/add_grad/tuple/control_dependency_1*
_class
loc:@model/b*
use_locking( *
T0*
_output_shapes
:
�
"training/optimizer/GradientDescentNoOpG^training/optimizer/GradientDescent/update_model/m/ApplyGradientDescentG^training/optimizer/GradientDescent/update_model/b/ApplyGradientDescent"��?��       53�	�z�I�A*�
f
m*a	   �ZL߿   �ZL߿      �?!   �ZL߿) �߆���?2�1%���Z%�޿�������:              �?        
f
b*a	   �=k�?   �=k�?      �?!   �=k�?) Q����?2�1%�?\l�9�?�������:              �?        

loss�!�<�TB��       �Wo�	���I�A*�
f
m*a	   @�ڿ   @�ڿ      �?!   @�ڿ)���>T�?2W�i�bۿ�^��h�ؿ�������:              �?        
f
b*a	   @���?   @���?      �?!   @���?) �_G���?2\l�9�?+Se*8�?�������:              �?        

loss���<4���       �Wo�	G��I�A*�
f
m*a	    �hٿ    �hٿ      �?!    �hٿ) �ջ2-�?2W�i�bۿ�^��h�ؿ�������:              �?        
f
b*a	   ��e�?   ��e�?      �?!   ��e�?) d:3'�?2\l�9�?+Se*8�?�������:              �?        

loss�ʍ<A���       �Wo�	V��I�A*�
f
m*a	   @nn׿   @nn׿      �?!   @nn׿)��s�;(�?2�^��h�ؿ��7�ֿ�������:              �?        
f
b*a	   ��3�?   ��3�?      �?!   ��3�?) �C�?2�1%�?\l�9�?�������:              �?        

loss�~<ڢ��       �Wo�	a��I�A*�
f
m*a	   ���տ   ���տ      �?!   ���տ) ĶU�#�?2��7�ֿ�Ca�G�Կ�������:              �?        
f
b*a	   ����?   ����?      �?!   ����?) d����?2�1%�?\l�9�?�������:              �?        

lossJ]d<�+=��       �Wo�	���I�A*�
f
m*a	   ``pԿ   ``pԿ      �?!   ``pԿ)@��7�?2�Ca�G�Կ_&A�o�ҿ�������:              �?        
f
b*a	    lD�?    lD�?      �?!    lD�?)@��]���?2�1%�?\l�9�?�������:              �?        

loss�fM<�X���       �Wo�	���I�A*�
f
m*a	   `O	ӿ   `O	ӿ      �?!   `O	ӿ)@���!��?2�Ca�G�Կ_&A�o�ҿ�������:              �?        
f
b*a	   ����?   ����?      �?!   ����?) I��b��?2�1%�?\l�9�?�������:              �?        

loss��8<��µ�       �Wo�	��I�A*�
f
m*a	   �ӱѿ   �ӱѿ      �?!   �ӱѿ) a�_���?2_&A�o�ҿ���ѿ�������:              �?        
f
b*a	    vy�?    vy�?      �?!    vy�?)@N���?2��Z%��?�1%�?�������:              �?        

lossH<&<~j�B�       �Wo�	b��I�A*�
f
m*a	   �*mп   �*mп      �?!   �*mп) ��=ݰ?2���ѿ�Z�_��ο�������:              �?        
f
b*a	   `M�?   `M�?      �?!   `M�?)@.F��8�?2��Z%��?�1%�?�������:              �?        

lossi�<{F�v�       �Wo�	�I�A	*�
f
m*a	   @.rο   @.rο      �?!   @.rο)���!���?2�Z�_��ο�K?̿�������:              �?        
f
b*a	    ��?    ��?      �?!    ��?) xI��?2��Z%��?�1%�?�������:              �?        

loss��<Ŗ�`�       �Wo�	V�I�A
*�
f
m*a	   �A*̿   �A*̿      �?!   �A*̿) �s+ʨ?2�Z�_��ο�K?̿�������:              �?        
f
b*a	   @b��?   @b��?      �?!   @b��?)��Ѧ���?2��Z%��?�1%�?�������:              �?        

lossL�;�3���       �Wo�	�I�A*�
f
m*a	   `� ʿ   `� ʿ      �?!   `� ʿ) YL!�?2�K?̿�@�"�ɿ�������:              �?        
f
b*a	   `C�?   `C�?      �?!   `C�?) ["�2��?2��Z%��?�1%�?�������:              �?        

loss��;K��(�       �Wo�	��I�A*�
f
m*a	    ��ǿ    ��ǿ      �?!    ��ǿ)  �����?2�@�"�ɿ�QK|:ǿ�������:              �?        
f
b*a	   �ܬ�?   �ܬ�?      �?!   �ܬ�?) �����?2W�i�b�?��Z%��?�������:              �?        

loss�`�;�D��       �Wo�	x)�I�A*�
f
m*a	   �Pƿ   �Pƿ      �?!   �Pƿ) ��e^F�?2�QK|:ǿyD$�ſ�������:              �?        
f
b*a	   `��?   `��?      �?!   `��?) E(�p�?2W�i�b�?��Z%��?�������:              �?        

loss�ذ;±���       �Wo�	�5�I�A*�
f
m*a	   ��*Ŀ   ��*Ŀ      �?!   ��*Ŀ)@�8�k�?2yD$�ſ�?>8s2ÿ�������:              �?        
f
b*a	   ����?   ����?      �?!   ����?) �w��?2W�i�b�?��Z%��?�������:              �?        

loss�J�;)��)�       �Wo�	�A�I�A*�
f
m*a	   @�k¿   @�k¿      �?!   @�k¿) ���4�?2�?>8s2ÿӖ8��s���������:              �?        
f
b*a	    ��?    ��?      �?!    ��?) ��|��?2W�i�b�?��Z%��?�������:              �?        

loss"��;��x�       �Wo�	�M�I�A*�
f
m*a	   `����   `����      �?!   `����)@FF
���?2Ӗ8��s��!�������������:              �?        
f
b*a	   �f��?   �f��?      �?!   �f��?)���{]��?2W�i�b�?��Z%��?�������:              �?        

loss�V�;V/^t�       �Wo�	�b�I�A*�
f
m*a	    �c��    �c��      �?!    �c��) �ݤ1܌?2!��������(!�ؼ��������:              �?        
f
b*a	   �p+�?   �p+�?      �?!   �p+�?) &�r��?2�^��h��?W�i�b�?�������:              �?        

loss�1i;���?�       �Wo�	mo�I�A*�
f
m*a	   @�i��   @�i��      �?!   @�i��)���L|�?2��(!�ؼ�%g�cE9���������:              �?        
f
b*a	   `u��?   `u��?      �?!   `u��?) ��O�Y�?2�^��h��?W�i�b�?�������:              �?        

loss(KR;^U	�       �Wo�	z�I�A*�
f
m*a	    ����    ����      �?!    ����)  �A�?2%g�cE9��8/�C�ַ��������:              �?        
f
b*a	   �$W�?   �$W�?      �?!   �$W�?) ~�<���?2�^��h��?W�i�b�?�������:              �?        

losse�=;ܔ0��       �Wo�	˅�I�A*�
f
m*a	    �굿    �굿      �?!    �굿) ��l=~?28/�C�ַ�� l(����������:              �?        
f
b*a	   �3��?   �3��?      �?!   �3��?)����w�?2�^��h��?W�i�b�?�������:              �?        

loss_7+;u��5�       �Wo�	��I�A*�
f
m*a	    �a��    �a��      �?!    �a��)@|J�zw?2�{ �ǳ����]$A鱿�������:              �?        
f
b*a	   �Z��?   �Z��?      �?!   �Z��?) ���x�?2�^��h��?W�i�b�?�������:              �?        

loss�;�DD�       �Wo�	��I�A*�
f
m*a	   @����   @����      �?!   @����) ш�xr?2��]$A鱿����iH���������:              �?        
f
b*a	   `U@�?   `U@�?      �?!   `U@�?) �c���?2�^��h��?W�i�b�?�������:              �?        

lossç;� Da�       �Wo�	I��I�A*�
f
m*a	   @�f��   @�f��      �?!   @�f��)�(jtk?2I�������g�骿�������:              �?        
f
b*a	    ���?    ���?      �?!    ���?) H2�/j�?2�^��h��?W�i�b�?�������:              �?        

loss�u�:�����       �Wo�	z��I�A*�
f
m*a	   ����   ����      �?!   ����)�P�'�c?2���g�骿�g���w���������:              �?        
f
b*a	   �ɝ�?   �ɝ�?      �?!   �ɝ�?) ehw���?2��7��?�^��h��?�������:              �?        

losssT�:9�T�       �Wo�	-��I�A*�
f
m*a	   ����   ����      �?!   ����)@�՗��[?2�/�*>��`��a�8���������:              �?        
f
b*a	   `�R�?   `�R�?      �?!   `�R�?) I��}�?2��7��?�^��h��?�������:              �?        

lossߤ�:�����       �Wo�	��I�A*�
f
m*a	    ,��    ,��      �?!    ,��)  yO�GR?2�uS��a���/����������:              �?        
f
b*a	   `��?   `��?      �?!   `��?) �X��?2��7��?�^��h��?�������:              �?        

loss�'�:M�5��       �Wo�	3��I�A*�
f
m*a	   ��ך�   ��ך�      �?!   ��ך�)��B7z�F?2��<�A���}Y�4j���������:              �?        
f
b*a	   �P��?   �P��?      �?!   �P��?)��+ڬ�?2��7��?�^��h��?�������:              �?        

loss죩:�5���       �Wo�	>��I�A*�
f
m*a	    eݓ�    eݓ�      �?!    eݓ�) ��Xǩ8?2^�S�����Rc�ݒ��������:              �?        
f
b*a	   `m��?   `m��?      �?!   `m��?) �%�bN�?2��7��?�^��h��?�������:              �?        

lossa�:�
�5�       �Wo�	���I�A*�
f
m*a	   @���   @���      �?!   @���)�\�i�%?2�7c_XY��#�+(�ŉ��������:              �?        
f
b*a	   ��K�?   ��K�?      �?!   ��K�?) ����?2��7��?�^��h��?�������:              �?        

loss��:p@y/�       �Wo�	� �I�A*�
f
m*a	   �N�{�   �N�{�      �?!   �N�{�) ��wYX?2���T}�o��5sz��������:              �?        
f
b*a	    r�?    r�?      �?!    r�?)  ց���?2��7��?�^��h��?�������:              �?        

loss!~:Z�
��       �Wo�	g
�I�A*�
f
m*a	    �P�    �P�      �?!    �P�)  $��>2nK���LQ�k�1^�sO��������:              �?        
f
b*a	    ��?    ��?      �?!    ��?) � 7nT�?2��7��?�^��h��?�������:              �?        

loss�;g:$#��       �Wo�	��I�A *�
f
m*a	   @#jr?   @#jr?      �?!   @#jr?) �]c�1�>2uWy��r?hyO�s?�������:              �?        
f
b*a	   `j��?   `j��?      �?!   `j��?) �Q��?2��7��?�^��h��?�������:              �?        

loss��R:37���       �Wo�	�!�I�A!*�
f
m*a	    ��?    ��?      �?!    ��?)@�?W��?2���J�\�?-Ա�L�?�������:              �?        
f
b*a	   �w�?   �w�?      �?!   �w�?)@ "*��?2�Ca�G��?��7��?�������:              �?        

loss>@:r�L�       �Wo�	�+�I�A"*�
f
m*a	   ��?   ��?      �?!   ��?)����m+,?2�7c_XY�?�#�h/�?�������:              �?        
f
b*a	   � I�?   � I�?      �?!   � I�?) Ҙg
�?2�Ca�G��?��7��?�������:              �?        

lossD�/:��i�       �Wo�	�5�I�A#*�
f
m*a	   �MГ?   �MГ?      �?!   �MГ?)@;�P�8?2�Rc�ݒ?^�S���?�������:              �?        
f
b*a	   �*�?   �*�?      �?!   �*�?)@��bj��?2�Ca�G��?��7��?�������:              �?        

loss�� :.ފ�       �Wo�	�?�I�A$*�
f
m*a	   ��]�?   ��]�?      �?!   ��]�?) U�f��B?2�"�uԖ?}Y�4j�?�������:              �?        
f
b*a	   �}��?   �}��?      �?!   �}��?)@HR��?2�Ca�G��?��7��?�������:              �?        

lossa[:�����       �Wo�	I�I�A%*�
f
m*a	   �[��?   �[��?      �?!   �[��?) �+�ִI?2��<�A��?�v��ab�?�������:              �?        
f
b*a	    ���?    ���?      �?!    ���?)  ���?2�Ca�G��?��7��?�������:              �?        

loss�Q:J��M�       �Wo�	�R�I�A&*�
f
m*a	   @�b�?   @�b�?      �?!   @�b�?) � ��P?2�v��ab�?�/��?�������:              �?        
f
b*a	    ���?    ���?      �?!    ���?)  �J�K�?2�Ca�G��?��7��?�������:              �?        

loss���9����       �Wo�	�\�I�A'*�
f
m*a	   �9S�?   �9S�?      �?!   �9S�?) q����T?2�/��?�uS��a�?�������:              �?        
f
b*a	   ���?   ���?      �?!   ���?) ي�"�?2�Ca�G��?��7��?�������:              �?        

loss���9��^�       �Wo�	�e�I�A(*�
f
m*a	    �)�?    �)�?      �?!    �)�?)@Tq�hY?2�uS��a�?`��a�8�?�������:              �?        
f
b*a	    ^a�?    ^a�?      �?!    ^a�?) @�E瑼?2�Ca�G��?��7��?�������:              �?        

loss6�9�K�       �Wo�	�~�I�A)*�
f
m*a	    ��?    ��?      �?!    ��?)  0��]?2`��a�8�?�/�*>�?�������:              �?        
f
b*a	   �uA�?   �uA�?      �?!   �uA�?) �>�<�?2�Ca�G��?��7��?�������:              �?        

loss�_�9�r�s�       �Wo�	��I�A**�
f
m*a	   `ێ�?   `ێ�?      �?!   `ێ�?) ���Wa?2�/�*>�?�g���w�?�������:              �?        
f
b*a	   �5#�?   �5#�?      �?!   �5#�?) �ܓ��?2�Ca�G��?��7��?�������:              �?        

lossnB�9��       �Wo�	���I�A+*�
f
m*a	   ���?   ���?      �?!   ���?) B`�ȹc?2�g���w�?���g��?�������:              �?        
f
b*a	   ���?   ���?      �?!   ���?) � �)��?2�Ca�G��?��7��?�������:              �?        

loss8��92
X�       �Wo�	��I�A,*�
f
m*a	   �ۛ�?   �ۛ�?      �?!   �ۛ�?) ��k< f?2�g���w�?���g��?�������:              �?        
f
b*a	   �Y��?   �Y��?      �?!   �Y��?) ���Y�?2�Ca�G��?��7��?�������:              �?        

loss�,�9I|���       �Wo�	U��I�A-*�
f
m*a	    +�?    +�?      �?!    +�?) L�h?2���g��?I���?�������:              �?        
f
b*a	    ���?    ���?      �?!    ���?)@P���?2�Ca�G��?��7��?�������:              �?        

loss[�9q���       �Wo�	��I�A.*�
f
m*a	   ��Y�?   ��Y�?      �?!   ��Y�?)�(ᗣ�j?2���g��?I���?�������:              �?        
f
b*a	   �%��?   �%��?      �?!   �%��?)@�5,=׺?2�Ca�G��?��7��?�������:              �?        

lossj��9�R��       �Wo�	��I�A/*�
f
m*a	   ����?   ����?      �?!   ����?) .��oJm?2I���?����iH�?�������:              �?        
f
b*a	   ����?   ����?      �?!   ����?) �0�_��?2�Ca�G��?��7��?�������:              �?        

loss=s�9 ���       �Wo�	���I�A0*�
f
m*a	   ��Я?   ��Я?      �?!   ��Я?) �M�Q�o?2I���?����iH�?�������:              �?        
f
b*a	    ��?    ��?      �?!    ��?)@ 4��b�?2_&A�o��?�Ca�G��?�������:              �?        

lossFv9��$��       �Wo�	W��I�A1*�
f
m*a	   ��y�?   ��y�?      �?!   ��y�?)@�+�%�p?2����iH�?��]$A�?�������:              �?        
f
b*a	   �7w�?   �7w�?      �?!   �7w�?) A
��-�?2_&A�o��?�Ca�G��?�������:              �?        

lossĩh9�ȉ��       �Wo�	���I�A2*�
f
m*a	   @��?   @��?      �?!   @��?) )��r?2����iH�?��]$A�?�������:              �?        
f
b*a	   `|c�?   `|c�?      �?!   `|c�?)@��!��?2_&A�o��?�Ca�G��?�������:              �?        

lossߦ\9���j�       �Wo�	���I�A3*�
f
m*a	   �v��?   �v��?      �?!   �v��?) Y�`&2s?2����iH�?��]$A�?�������:              �?        
f
b*a	   ��P�?   ��P�?      �?!   ��P�?)@����˹?2_&A�o��?�Ca�G��?�������:              �?        

loss}�Q9?ث1�       �Wo�	���I�A4*�
f
m*a	   @m�?   @m�?      �?!   @m�?) �9.vEt?2��]$A�?�{ �ǳ�?�������:              �?        
f
b*a	   @?�?   @?�?      �?!   @?�?) a����?2_&A�o��?�Ca�G��?�������:              �?        

loss(H9͹�       �Wo�	��I�A5*�
f
m*a	   ��w�?   ��w�?      �?!   ��w�?) $��bQu?2��]$A�?�{ �ǳ�?�������:              �?        
f
b*a	   �<.�?   �<.�?      �?!   �<.�?) �6~t�?2_&A�o��?�Ca�G��?�������:              �?        

loss!p?9�����       �Wo�	.�I�A6*�
f
m*a	   @Y�?   @Y�?      �?!   @Y�?) �	�Uv?2��]$A�?�{ �ǳ�?�������:              �?        
f
b*a	    M�?    M�?      �?!    M�?) �2��K�?2_&A�o��?�Ca�G��?�������:              �?        

loss[�79�J(�       �Wo�	-
�I�A7*�
f
m*a	   ��P�?   ��P�?      �?!   ��P�?)@h���Qw?2��]$A�?�{ �ǳ�?�������:              �?        
f
b*a	   �1�?   �1�?      �?!   �1�?) $i-
&�?2_&A�o��?�Ca�G��?�������:              �?        

lossŏ09�~ے�       �Wo�	��I�A8*�
f
m*a	   `��?   `��?      �?!   `��?)@��Fx?2�{ �ǳ�?� l(��?�������:              �?        
f
b*a	    � �?    � �?      �?!    � �?) $�-�?2_&A�o��?�Ca�G��?�������:              �?        

loss�;*9��)��       �Wo�	��I�A9*�
f
m*a	   @��?   @��?      �?!   @��?) 1��2y?2�{ �ǳ�?� l(��?�������:              �?        
f
b*a	   `K��?   `K��?      �?!   `K��?)@�F�?2_&A�o��?�Ca�G��?�������:              �?        

loss�$9U_�       �Wo�	�'�I�A:*�
f
m*a	    �m�?    �m�?      �?!    �m�?)@�#�z?2�{ �ǳ�?� l(��?�������:              �?        
f
b*a	   @l��?   @l��?      �?!   @l��?) a�7��?2_&A�o��?�Ca�G��?�������:              �?        

loss�o9)�x�       �Wo�	�1�I�A;*�
f
m*a	   �Dô?   �Dô?      �?!   �Dô?) D�Vz�z?2�{ �ǳ�?� l(��?�������:              �?        
f
b*a	   �8��?   �8��?      �?!   �8��?)@f��桸?2_&A�o��?�Ca�G��?�������:              �?        

loss��9΋��       �Wo�	�>�I�A<*�
f
m*a	   @!�?   @!�?      �?!   @!�?) e���{?2�{ �ǳ�?� l(��?�������:              �?        
f
b*a	   ����?   ����?      �?!   ����?) ���:��?2_&A�o��?�Ca�G��?�������:              �?        

loss��9O<c��       �Wo�	&V�I�A=*�
f
m*a	   @�`�?   @�`�?      �?!   @�`�?) Y��Y�|?2�{ �ǳ�?� l(��?�������:              �?        
f
b*a	   @���?   @���?      �?!   @���?) ���j�?2_&A�o��?�Ca�G��?�������:              �?        

lossO9�       �Wo�	|_�I�A>*�
f
m*a	   �t��?   �t��?      �?!   �t��?)@�Q��S}?2�{ �ǳ�?� l(��?�������:              �?        
f
b*a	    K��?    K��?      �?!    K��?) ���sP�?2_&A�o��?�Ca�G��?�������:              �?        

lossث9�d�#�       �Wo�	@k�I�A?*�
f
m*a	    Y�?    Y�?      �?!    Y�?)@th��~?2� l(��?8/�C�ַ?�������:              �?        
f
b*a	   @p��?   @p��?      �?!   @p��?) ��B.8�?2_&A�o��?�Ca�G��?�������:              �?        

loss֬9t�h�       �Wo�	�t�I�A@*�
f
m*a	    �/�?    �/�?      �?!    �/�?)  ���~?2� l(��?8/�C�ַ?�������:              �?        
f
b*a	   ���?   ���?      �?!   ���?)@��6!�?2_&A�o��?�Ca�G��?�������:              �?        

loss��	9��*��       �Wo�	A~�I�AA*�
f
m*a	   ��m�?   ��m�?      �?!   ��m�?) $�s>p?2� l(��?8/�C�ַ?�������:              �?        
f
b*a	   `=��?   `=��?      �?!   `=��?)@ng	{�?2_&A�o��?�Ca�G��?�������:              �?        

loss�9�Ñn�       �Wo�	߈�I�AB*�
f
m*a	   �B��?   �B��?      �?!   �B��?)�<k��
�?2� l(��?8/�C�ַ?�������:              �?        
f
b*a	    ؔ�?    ؔ�?      �?!    ؔ�?)  d����?2_&A�o��?�Ca�G��?�������:              �?        

lossSc9%����       �Wo�	���I�AC*�
f
m*a	   ��߶?   ��߶?      �?!   ��߶?)����Y�?2� l(��?8/�C�ַ?�������:              �?        
f
b*a	   `��?   `��?      �?!   `��?)@�*r�?2_&A�o��?�Ca�G��?�������:              �?        

losso9z�I��       �Wo�	+��I�AD*�
f
m*a	    ��?    ��?      �?!    ��?)  �򻥀?2� l(��?8/�C�ַ?�������:              �?        
f
b*a	   �V��?   �V��?      �?!   �V��?) Y<ѷ?2_&A�o��?�Ca�G��?�������:              �?        

loss]�9H����       �Wo�	m��I�AE*�
f
m*a	    �F�?    �F�?      �?!    �F�?) ֔<,�?2� l(��?8/�C�ַ?�������:              �?        
f
b*a	   �/~�?   �/~�?      �?!   �/~�?)@¥J���?2_&A�o��?�Ca�G��?�������:              �?        

lossF 9��)=�       �Wo�	ݴ�I�AF*�
f
m*a	   `v�?   `v�?      �?!   `v�?) u
4h3�?2� l(��?8/�C�ַ?�������:              �?        
f
b*a	   �gw�?   �gw�?      �?!   �gw�?)@"4��?2_&A�o��?�Ca�G��?�������:              �?        

loss4\�8�f�       �Wo�	'��I�AG*�
f
m*a	   ����?   ����?      �?!   ����?) �?�u�?2� l(��?8/�C�ַ?�������:              �?        
f
b*a	    �p�?    �p�?      �?!    �p�?) @B{o��?2_&A�o��?�Ca�G��?�������:              �?        

loss}��8I���       �Wo�	���I�AH*�
f
m*a	   ��ͷ?   ��ͷ?      �?!   ��ͷ?) �YT���?2� l(��?8/�C�ַ?�������:              �?        
f
b*a	    �j�?    �j�?      �?!    �j�?) @�����?2_&A�o��?�Ca�G��?�������:              �?        

loss��8���       �Wo�	���I�AI*�
f
m*a	   @���?   @���?      �?!   @���?)������?28/�C�ַ?%g�cE9�?�������:              �?        
f
b*a	    e�?    e�?      �?!    e�?) ����?2_&A�o��?�Ca�G��?�������:              �?        

loss�u�8��       �Wo�	D��I�AJ*�
f
m*a	   `D�?   `D�?      �?!   `D�?) :�*�?28/�C�ַ?%g�cE9�?�������:              �?        
f
b*a	    �_�?    �_�?      �?!    �_�?) 4�Yu�?2_&A�o��?�Ca�G��?�������:              �?        

loss��8����       �Wo�	���I�AK*�
f
m*a	   ��@�?   ��@�?      �?!   ��@�?)����Ya�?28/�C�ַ?%g�cE9�?�������:              �?        
f
b*a	   �oZ�?   �oZ�?      �?!   �oZ�?)@@���h�?2_&A�o��?�Ca�G��?�������:              �?        

loss(��8�2/��       �Wo�	x��I�AL*�
f
m*a	   ��b�?   ��b�?      �?!   ��b�?) �奕�?28/�C�ַ?%g�cE9�?�������:              �?        
f
b*a	   ��U�?   ��U�?      �?!   ��U�?)@�jA�\�?2_&A�o��?�Ca�G��?�������:              �?        

loss�s�8�Vd\�       �Wo�	���I�AM*�
f
m*a	    ���?    ���?      �?!    ���?)  �~ǂ?28/�C�ַ?%g�cE9�?�������:              �?        
f
b*a	   `�P�?   `�P�?      �?!   `�P�?)@>I͜Q�?2_&A�o��?�Ca�G��?�������:              �?        

loss��8w����       �Wo�	�I�AN*�
f
m*a	    ���?    ���?      �?!    ���?)  PF���?28/�C�ַ?%g�cE9�?�������:              �?        
f
b*a	    mL�?    mL�?      �?!    mL�?) �f��F�?2_&A�o��?�Ca�G��?�������:              �?        

loss���8/l���       �Wo�	��I�AO*�
f
m*a	   @ҿ�?   @ҿ�?      �?!   @ҿ�?)�hA;9$�?28/�C�ַ?%g�cE9�?�������:              �?        
f
b*a	   �;H�?   �;H�?      �?!   �;H�?) D]h�<�?2_&A�o��?�Ca�G��?�������:              �?        

loss���8*o�x�       �Wo�	��I�AP*�
f
m*a	   `�۸?   `�۸?      �?!   `�۸?) )^�MO�?28/�C�ַ?%g�cE9�?�������:              �?        
f
b*a	   �AD�?   �AD�?      �?!   �AD�?)@8��?3�?2_&A�o��?�Ca�G��?�������:              �?        

loss@��8xU�6�       �Wo�	]1�I�AQ*�
f
m*a	   `���?   `���?      �?!   `���?) 9H�Px�?28/�C�ַ?%g�cE9�?�������:              �?        
f
b*a	    }@�?    }@�?      �?!    }@�?)@��-*�?2_&A�o��?�Ca�G��?�������:              �?        

loss���8��j��       �Wo�	�:�I�AR*�
f
m*a	   ���?   ���?      �?!   ���?)�h�rZ��?28/�C�ַ?%g�cE9�?�������:              �?        
f
b*a	   ��<�?   ��<�?      �?!   ��<�?)@� )�!�?2_&A�o��?�Ca�G��?�������:              �?        

lossV-�8ϻ���       �Wo�	�C�I�AS*�
f
m*a	   ��&�?   ��&�?      �?!   ��&�?) ���ă?28/�C�ַ?%g�cE9�?�������:              �?        
f
b*a	   ��9�?   ��9�?      �?!   ��9�?)@���p�?2_&A�o��?�Ca�G��?�������:              �?        

loss)x�8��j�       �Wo�	�N�I�AT*�
f
m*a	    =�?    =�?      �?!    =�?) �>h��?28/�C�ַ?%g�cE9�?�������:              �?        
f
b*a	   �Q6�?   �Q6�?      �?!   �Q6�?) �q���?2_&A�o��?�Ca�G��?�������:              �?        

lossX��8�%�,�       �Wo�	�X�I�AU*�
f
m*a	   �RR�?   �RR�?      �?!   �RR�?) ��Gu	�?28/�C�ַ?%g�cE9�?�������:              �?        
f
b*a	   �F3�?   �F3�?      �?!   �F3�?) ���k
�?2_&A�o��?�Ca�G��?�������:              �?        

lossC�8	�NS�       �Wo�	�b�I�AV*�
f
m*a	   �~f�?   �~f�?      �?!   �~f�?) 1#n)�?28/�C�ַ?%g�cE9�?�������:              �?        
f
b*a	   �c0�?   �c0�?      �?!   �c0�?)@p���?2_&A�o��?�Ca�G��?�������:              �?        

loss���8TT(�       �Wo�	�k�I�AW*�
f
m*a	   ��y�?   ��y�?      �?!   ��y�?)����G�?28/�C�ַ?%g�cE9�?�������:              �?        
f
b*a	   ��-�?   ��-�?      �?!   ��-�?)@"�a���?2_&A�o��?�Ca�G��?�������:              �?        

lossWI�8-&�=�       �Wo�	v�I�AX*�
f
m*a	   @���?   @���?      �?!   @���?)�7��d�?28/�C�ַ?%g�cE9�?�������:              �?        
f
b*a	   �+�?   �+�?      �?!   �+�?)@�c����?2_&A�o��?�Ca�G��?�������:              �?        

loss$��8��mG�       �Wo�	J�I�AY*�
f
m*a	   `휹?   `휹?      �?!   `휹?) �Hw4��?28/�C�ַ?%g�cE9�?�������:              �?        
f
b*a	   ��(�?   ��(�?      �?!   ��(�?) �S���?2_&A�o��?�Ca�G��?�������:              �?        

loss��8O.W�       �Wo�	U��I�AZ*�
f
m*a	   �7��?   �7��?      �?!   �7��?) ���P��?28/�C�ַ?%g�cE9�?�������:              �?        
f
b*a	    F&�?    F&�?      �?!    F&�?) @��A�?2_&A�o��?�Ca�G��?�������:              �?        

loss�)�8���       �Wo�	!��I�A[*�
f
m*a	   `���?   `���?      �?!   `���?) �� ��?28/�C�ַ?%g�cE9�?�������:              �?        
f
b*a	   `$�?   `$�?      �?!   `$�?)@��-��?2_&A�o��?�Ca�G��?�������:              �?        

loss���8�[��       �Wo�	���I�A\*�
f
m*a	   `M˹?   `M˹?      �?!   `M˹?) m��ʄ?28/�C�ַ?%g�cE9�?�������:              �?        
f
b*a	   @�!�?   @�!�?      �?!   @�!�?) ����?2_&A�o��?�Ca�G��?�������:              �?        

loss���8<il�       �Wo�	���I�A]*�
f
m*a	   �.ٹ?   �.ٹ?      �?!   �.ٹ?) ���?28/�C�ַ?%g�cE9�?�������:              �?        
f
b*a	    ��?    ��?      �?!    ��?)  p6ܶ?2_&A�o��?�Ca�G��?�������:              �?        

lossCY�8�}�       �Wo�	��I�A^*�
f
m*a	   �V�?   �V�?      �?!   �V�?)�,�a��?28/�C�ַ?%g�cE9�?�������:              �?        
f
b*a	    �?    �?      �?!    �?)@�"��׶?2_&A�o��?�Ca�G��?�������:              �?        

lossL!�8��k��       �Wo�	˺�I�A_*�
f
m*a	    ��?    ��?      �?!    ��?)  Ho�
�?28/�C�ַ?%g�cE9�?�������:              �?        
f
b*a	   `Q�?   `Q�?      �?!   `Q�?)@�mbsӶ?2_&A�o��?�Ca�G��?�������:              �?        

loss��8p�_%�       �Wo�	���I�A`*�
f
m*a	    ���?    ���?      �?!    ���?) H����?28/�C�ַ?%g�cE9�?�������:              �?        
f
b*a	   `��?   `��?      �?!   `��?)@�3i϶?2_&A�o��?�Ca�G��?�������:              �?        

loss���8�;G��       �Wo�	���I�Aa*�
f
m*a	   ��	�?   ��	�?      �?!   ��	�?) s�0�?28/�C�ַ?%g�cE9�?�������:              �?        
f
b*a	   ��?   ��?      �?!   ��?)@(^�˶?2_&A�o��?�Ca�G��?�������:              �?        

loss6��8��B��       �Wo�	���I�Ab*�
f
m*a	    y�?    y�?      �?!    y�?) �	�QA�?28/�C�ַ?%g�cE9�?�������:              �?        
f
b*a	   ���?   ���?      �?!   ���?) 	4N�Ƕ?2_&A�o��?�Ca�G��?�������:              �?        

loss�t�8۱'�       �Wo�	���I�Ac*�
f
m*a	   ���?   ���?      �?!   ���?) h�t�Q�?28/�C�ַ?%g�cE9�?�������:              �?        
f
b*a	   ��?   ��?      �?!   ��?)@���Ķ?2_&A�o��?�Ca�G��?�������:              �?        

loss�S�8`p��       �Wo�	���I�Ad*�
f
m*a	   �(�?   �(�?      �?!   �(�?) �AZa�?28/�C�ַ?%g�cE9�?�������:              �?        
f
b*a	    ��?    ��?      �?!    ��?)@�A��?2_&A�o��?�Ca�G��?�������:              �?        

lossn6�8��H'�       �Wo�	��I�Ae*�
f
m*a	   @&1�?   @&1�?      �?!   @&1�?)��Q�)p�?28/�C�ַ?%g�cE9�?�������:              �?        
f
b*a	   �f�?   �f�?      �?!   �f�?)@>NB+��?2_&A�o��?�Ca�G��?�������:              �?        

loss��8Y�;\�       �Wo�	k�I�Af*�
f
m*a	   @�9�?   @�9�?      �?!   @�9�?)��[o8~�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   @,�?   @,�?      �?!   @,�?) a
�=��?2_&A�o��?�Ca�G��?�������:              �?        

loss&�8C>���       �Wo�	��I�Ag*�
f
m*a	   @�A�?   @�A�?      �?!   @�A�?)��뼐��?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   `�?   `�?      �?!   `�?)@Z�w��?2_&A�o��?�Ca�G��?�������:              �?        

loss���8 ��`�       �Wo�	y$�I�Ah*�
f
m*a	   ��I�?   ��I�?      �?!   ��I�?)�t_�:��?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ���?   ���?      �?!   ���?)@`�ֵ�?2_&A�o��?�Ca�G��?�������:              �?        

loss}��8�}o��       �Wo�	�-�I�Ai*�
f
m*a	   ��P�?   ��P�?      �?!   ��P�?) k�@��?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	    ��?    ��?      �?!    ��?)@p�X��?2_&A�o��?�Ca�G��?�������:              �?        

loss6��8C����       �Wo�	*7�I�Aj*�
f
m*a	    �W�?    �W�?      �?!    �W�?) �n���?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   @��?   @��?      �?!   @��?) 17����?2_&A�o��?�Ca�G��?�������:              �?        

loss���8`Wj��       �Wo�	�@�I�Ak*�
f
m*a	   `e^�?   `e^�?      �?!   `e^�?) '�0{��?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ���?   ���?      �?!   ���?)@9ξ��?2_&A�o��?�Ca�G��?�������:              �?        

loss���8e���       �Wo�	'J�I�Al*�
f
m*a	    �d�?    �d�?      �?!    �d�?) @��ą?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   �	�?   �	�?      �?!   �	�?) �E����?2_&A�o��?�Ca�G��?�������:              �?        

loss3��8.��*�       �Wo�	XS�I�Am*�
f
m*a	    �j�?    �j�?      �?!    �j�?)  B�΅?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   @1�?   @1�?      �?!   @1�?) �O̜��?2_&A�o��?�Ca�G��?�������:              �?        

loss��8�#�       �Wo�	1]�I�An*�
f
m*a	    !p�?    !p�?      �?!    !p�?) J��ׅ?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   @d
�?   @d
�?      �?!   @d
�?) !�״��?2_&A�o��?�Ca�G��?�������:              �?        

lossъ�80����       �Wo�	
j�I�Ao*�
f
m*a	   �ou�?   �ou�?      �?!   �ou�?)�@�����?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   �	�?   �	�?      �?!   �	�?)@��@榶?2_&A�o��?�Ca�G��?�������:              �?        

loss���8`O���       �Wo�	�t�I�Ap*�
f
m*a	   �wz�?   �wz�?      �?!   �wz�?)� �J��?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ���?   ���?      �?!   ���?)@J��/��?2_&A�o��?�Ca�G��?�������:              �?        

loss�y�8�8�*�       �Wo�	9~�I�Aq*�
f
m*a	   �<�?   �<�?      �?!   �<�?)�T�����?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	    ;�?    ;�?      �?!    ;�?) ��[���?2_&A�o��?�Ca�G��?�������:              �?        

loss)r�8�LJ��       �Wo�	n��I�Ar*�
f
m*a	   @�?   @�?      �?!   @�?)�(+:��?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   `��?   `��?      �?!   `��?)@�&\��?2_&A�o��?�Ca�G��?�������:              �?        

loss�k�8X;��       �Wo�	���I�As*�
f
m*a	   ���?   ���?      �?!   ���?) 9�FU��?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   `��?   `��?      �?!   `��?)@�W퐠�?2_&A�o��?�Ca�G��?�������:              �?        

loss�e�8Nϡe�       �Wo�	̛�I�At*�
f
m*a	    ��?    ��?      �?!    ��?) ���?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   �c�?   �c�?      �?!   �c�?)@R$)/��?2_&A�o��?�Ca�G��?�������:              �?        

lossC`�8@f��       �Wo�	��I�Au*�
f
m*a	    ���?    ���?      �?!    ���?) #�w�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ���?   ���?      �?!   ���?) �K�ߝ�?2_&A�o��?�Ca�G��?�������:              �?        

loss[�8�T�       �Wo�	`��I�Av*�
f
m*a	    ���?    ���?      �?!    ���?) ��B��?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   �P�?   �P�?      �?!   �P�?) �����?2_&A�o��?�Ca�G��?�������:              �?        

loss,W�8���       �Wo�	��I�Aw*�
f
m*a	   ���?   ���?      �?!   ���?) ��H�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	    ��?    ��?      �?!    ��?) @�3t��?2_&A�o��?�Ca�G��?�������:              �?        

lossNS�8A%���       �Wo�	���I�Ax*�
f
m*a	   �[��?   �[��?      �?!   �[��?) Y�v��?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   �Y�?   �Y�?      �?!   �Y�?) q�VV��?2_&A�o��?�Ca�G��?�������:              �?        

loss�O�8�Ҭ�       �Wo�	w��I�Ay*�
f
m*a	   @x��?   @x��?      �?!   @x��?)��M�"�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ���?   ���?      �?!   ���?)@`�G��?2_&A�o��?�Ca�G��?�������:              �?        

loss�L�8Ҵu��       �Wo�	��I�Az*�
f
m*a	   @k��?   @k��?      �?!   @k��?)�t�y�'�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   �{�?   �{�?      �?!   �{�?)@3�F��?2_&A�o��?�Ca�G��?�������:              �?        

loss�I�8�k��       �Wo�	W��I�A{*�
f
m*a	    7��?    7��?      �?!    7��?) ���y,�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ��?   ��?      �?!   ��?) �,�S��?2_&A�o��?�Ca�G��?�������:              �?        

lossWG�8]�W�       �Wo�	���I�A|*�
f
m*a	   �ݥ�?   �ݥ�?      �?!   �ݥ�?) 25��0�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   `��?   `��?      �?!   `��?)@r	�l��?2_&A�o��?�Ca�G��?�������:              �?        

lossE�80�'5�       �Wo�	���I�A}*�
f
m*a	   �`��?   �`��?      �?!   �`��?) FUf5�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   `X�?   `X�?      �?!   `X�?)@" <���?2_&A�o��?�Ca�G��?�������:              �?        

lossC�8s�ߕ�       �Wo�	_
�I�A~*�
f
m*a	   �ª�?   �ª�?      �?!   �ª�?) ��|9�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	    �?    �?      �?!    �?)@H��?2_&A�o��?�Ca�G��?�������:              �?        

loss3A�8`2�p�       �Wo�	b�I�A*�
f
m*a	   ���?   ���?      �?!   ���?)��\3�<�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ���?   ���?      �?!   ���?) $?����?2_&A�o��?�Ca�G��?�������:              �?        

loss�?�8�e���       ��h�	:�I�A�*�
f
m*a	   �(��?   �(��?      �?!   �(��?)����`@�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	    `�?    `�?      �?!    `�?)  @D��?2_&A�o��?�Ca�G��?�������:              �?        

loss>�8G[0H�       ��h�	)�I�A�*�
f
m*a	   `0��?   `0��?      �?!   `0��?) !o��C�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ��?   ��?      �?!   ��?) �պ���?2_&A�o��?�Ca�G��?�������:              �?        

loss�<�8�nX�       ��h�	�2�I�A�*�
f
m*a	   ���?   ���?      �?!   ���?) $w�F�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   @� �?   @� �?      �?!   @� �?) �|B쑶?2_&A�o��?�Ca�G��?�������:              �?        

loss�;�8F'}��       ��h�	<�I�A�*�
f
m*a	   �ﴺ?   �ﴺ?      �?!   �ﴺ?)  ��J�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   �� �?   �� �?      �?!   �� �?) �ѴM��?2_&A�o��?�Ca�G��?�������:              �?        

loss|:�8���(�       ��h�	�D�I�A�*�
f
m*a	   ����?   ����?      �?!   ����?) r���L�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	    M �?    M �?      �?!    M �?)@�s-���?2_&A�o��?�Ca�G��?�������:              �?        

loss}9�8p��       ��h�	�M�I�A�*�
f
m*a	    N��?    N��?      �?!    N��?) �.w�O�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	     �?     �?      �?!     �?)@T�(��?2_&A�o��?�Ca�G��?�������:              �?        

loss�8�8(tVk�       ��h�	Z�I�A�*�
f
m*a	   �۹�?   �۹�?      �?!   �۹�?) �4�<R�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   @���?   @���?      �?!   @���?) �b����?2_&A�o��?�Ca�G��?�������:              �?        

loss�7�8!: Y�       ��h�	�c�I�A�*�
f
m*a	    U��?    U��?      �?!    U��?) �QʲT�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   @���?   @���?      �?!   @���?) Q%Z!��?2_&A�o��?�Ca�G��?�������:              �?        

loss&7�8�{.��       ��h�	�l�I�A�*�
f
m*a	   ����?   ����?      �?!   ����?) gYW�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	    o��?    o��?      �?!    o��?)@�񧎶?2_&A�o��?�Ca�G��?�������:              �?        

loss�6�8��T�       ��h�	�v�I�A�*�
f
m*a	   ���?   ���?      �?!   ���?) �U�>Y�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   �>��?   �>��?      �?!   �>��?)@!�4��?2_&A�o��?�Ca�G��?�������:              �?        

loss�5�8pui��       ��h�	���I�A�*�
f
m*a	   �N��?   �N��?      �?!   �N��?) jT�W[�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ���?   ���?      �?!   ���?) ���Ǎ�?2_&A�o��?�Ca�G��?�������:              �?        

lossx5�8�(9��       ��h�	H��I�A�*�
f
m*a	   @��?   @��?      �?!   @��?)���T]�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	    ���?    ���?      �?!    ���?)@$�?`��?2_&A�o��?�Ca�G��?�������:              �?        

loss�4�8�P��       ��h�	O��I�A�*�
f
m*a	    ���?    ���?      �?!    ���?)   �7_�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ���?   ���?      �?!   ���?)@�M���?2_&A�o��?�Ca�G��?�������:              �?        

loss�4�8�,��       ��h�	���I�A�*�
f
m*a	   ��º?   ��º?      �?!   ��º?) ��1a�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ����?   ����?      �?!   ����?)@�<���?2_&A�o��?�Ca�G��?�������:              �?        

loss64�8�SL$�       ��h�	���I�A�*�
f
m*a	   @�ú?   @�ú?      �?!   @�ú?)���t�b�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   �o��?   �o��?      �?!   �o��?)@�"CI��?2_&A�o��?�Ca�G��?�������:              �?        

loss�3�8�D�       ��h�	ƿ�I�A�*�
f
m*a	    �ĺ?    �ĺ?      �?!    �ĺ?) ��Nd�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   `L��?   `L��?      �?!   `L��?)@�T����?2_&A�o��?�Ca�G��?�������:              �?        

loss�3�8z8�(�       ��h�	2��I�A�*�
f
m*a	   `�ź?   `�ź?      �?!   `�ź?) ��	�e�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	    +��?    +��?      �?!    +��?) ��U���?2_&A�o��?�Ca�G��?�������:              �?        

lossN3�8Yk
;�       ��h�	=��I�A�*�
f
m*a	   �qƺ?   �qƺ?      �?!   �qƺ?) �"Gg�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   `��?   `��?      �?!   `��?)@0A[��?2_&A�o��?�Ca�G��?�������:              �?        

loss3�8\ȱ�       ��h�	���I�A�*�
f
m*a	    CǺ?    CǺ?      �?!    CǺ?) �jߥh�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   `���?   `���?      �?!   `���?)@����?2_&A�o��?�Ca�G��?�������:              �?        

loss�2�8�����       ��h�	���I�A�*�
f
m*a	   �	Ⱥ?   �	Ⱥ?      �?!   �	Ⱥ?)���Q�i�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	    ���?    ���?      �?!    ���?) J�Њ�?2_&A�o��?�Ca�G��?�������:              �?        

loss�2�8k����       ��h�	���I�A�*�
f
m*a	    �Ⱥ?    �Ⱥ?      �?!    �Ⱥ?)  �o-k�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	    ���?    ���?      �?!    ���?) @֓���?2_&A�o��?�Ca�G��?�������:              �?        

lossx2�8�����       ��h�	���I�A�*�
f
m*a	   �xɺ?   �xɺ?      �?!   �xɺ?) � yXl�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ����?   ����?      �?!   ����?) �JT��?2_&A�o��?�Ca�G��?�������:              �?        

lossR2�8��#��       ��h�	O	�I�A�*�
f
m*a	   �!ʺ?   �!ʺ?      �?!   �!ʺ?) ���sm�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   @���?   @���?      �?!   @���?) !�z��?2_&A�o��?�Ca�G��?�������:              �?        

loss/2�8=LV��       ��h�	�	�I�A�*�
f
m*a	   `�ʺ?   `�ʺ?      �?!   `�ʺ?) ����n�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   `m��?   `m��?      �?!   `m��?)@��-䉶?2_&A�o��?�Ca�G��?�������:              �?        

loss2�8q����       ��h�	�	�I�A�*�
f
m*a	   `Z˺?   `Z˺?      �?!   `Z˺?) =�o�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   �W��?   �W��?      �?!   �W��?)@�����?2_&A�o��?�Ca�G��?�������:              �?        

loss�1�8�0z��       ��h�	�	�I�A�*�
f
m*a	   ��˺?   ��˺?      �?!   ��˺?) r�}pp�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	    C��?    C��?      �?!    C��?) �����?2_&A�o��?�Ca�G��?�������:              �?        

loss�1�8�X�       ��h�	N*	�I�A�*�
f
m*a	    s̺?    s̺?      �?!    s̺?) .vQUq�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   `/��?   `/��?      �?!   `/��?)@F�Q��?2_&A�o��?�Ca�G��?�������:              �?        

loss�1�8�~`�       ��h�	�6	�I�A�*�
f
m*a	   ��̺?   ��̺?      �?!   ��̺?) �y�.r�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ���?   ���?      �?!   ���?)@`%��?2_&A�o��?�Ca�G��?�������:              �?        

loss�1�8h��\�       ��h�	�@	�I�A�*�
f
m*a	   �oͺ?   �oͺ?      �?!   �oͺ?)�@Ry�r�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   @��?   @��?      �?!   @��?) ��C���?2_&A�o��?�Ca�G��?�������:              �?        

loss�1�8 =���       ��h�	�K	�I�A�*�
f
m*a	   @�ͺ?   @�ͺ?      �?!   @�ͺ?)�Т�s�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ����?   ����?      �?!   ����?)@��ӈ�?2_&A�o��?�Ca�G��?�������:              �?        

loss�1�8���       ��h�	�T	�I�A�*�
f
m*a	   �Rκ?   �Rκ?      �?!   �Rκ?) W��xt�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ����?   ����?      �?!   ����?)@�l���?2_&A�o��?�Ca�G��?�������:              �?        

lossz1�8�+�       ��h�	�]	�I�A�*�
f
m*a	   @�κ?   @�κ?      �?!   @�κ?)���'u�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ����?   ����?      �?!   ����?)@��ъ��?2_&A�o��?�Ca�G��?�������:              �?        

lossi1�8�I��       ��h�	�f	�I�A�*�
f
m*a	   �Ϻ?   �Ϻ?      �?!   �Ϻ?) �"�u�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ����?   ����?      �?!   ����?)@���h��?2_&A�o��?�Ca�G��?�������:              �?        

loss`1�8�^���       ��h�	_	�I�A�*�
f
m*a	   �|Ϻ?   �|Ϻ?      �?!   �|Ϻ?) [;�kv�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   @���?   @���?      �?!   @���?) �@I��?2_&A�o��?�Ca�G��?�������:              �?        

lossW1�8�A��       ��h�	��	�I�A�*�
f
m*a	   ��Ϻ?   ��Ϻ?      �?!   ��Ϻ?)���2w�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ����?   ����?      �?!   ����?) ��*��?2_&A�o��?�Ca�G��?�������:              �?        

lossH1�8ⴿ6�       ��h�	�	�I�A�*�
f
m*a	    *к?    *к?      �?!    *к?) tח�w�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   `���?   `���?      �?!   `���?)@�&7��?2_&A�o��?�Ca�G��?�������:              �?        

loss?1�8���       ��h�	��	�I�A�*�
f
m*a	   @zк?   @zк?      �?!   @zк?)��x�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ����?   ����?      �?!   ����?)@����?2_&A�o��?�Ca�G��?�������:              �?        

loss21�8z>�       ��h�	�	�I�A�*�
f
m*a	   `�к?   `�к?      �?!   `�к?) ŭs�x�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	    ���?    ���?      �?!    ���?) �ه�?2_&A�o��?�Ca�G��?�������:              �?        

loss,1�8�����       ��h�	
�	�I�A�*�
f
m*a	   �Ѻ?   �Ѻ?      �?!   �Ѻ?) �nUy�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ����?   ����?      �?!   ����?) �����?2_&A�o��?�Ca�G��?�������:              �?        

loss)1�8.8��       ��h�	��	�I�A�*�
f
m*a	   �RѺ?   �RѺ?      �?!   �RѺ?)����y�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	    }��?    }��?      �?!    }��?) �P����?2_&A�o��?�Ca�G��?�������:              �?        

loss#1�8�����       ��h�	��	�I�A�*�
f
m*a	   `�Ѻ?   `�Ѻ?      �?!   `�Ѻ?) ���y�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   �s��?   �s��?      �?!   �s��?) ae����?2_&A�o��?�Ca�G��?�������:              �?        

loss1�8��p�       ��h�	��	�I�A�*�
f
m*a	   ��Ѻ?   ��Ѻ?      �?!   ��Ѻ?) #z�Rz�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   �j��?   �j��?      �?!   �j��?)@�Y�~��?2_&A�o��?�Ca�G��?�������:              �?        

loss1�8rQ��       ��h�	��	�I�A�*�
f
m*a	    Һ?    Һ?      �?!    Һ?) �c��z�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   �b��?   �b��?      �?!   �b��?)@�k��?2_&A�o��?�Ca�G��?�������:              �?        

loss1�8u�X��       ��h�	��	�I�A�*�
f
m*a	    BҺ?    BҺ?      �?!    BҺ?) �l�{�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   �Z��?   �Z��?      �?!   �Z��?) ��\X��?2_&A�o��?�Ca�G��?�������:              �?        

loss1�85�1��       ��h�	Q�	�I�A�*�
f
m*a	   `vҺ?   `vҺ?      �?!   `vҺ?) �a�h{�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   @S��?   @S��?      �?!   @S��?) )�F��?2_&A�o��?�Ca�G��?�������:              �?        

loss1�8݉��       ��h�	��	�I�A�*�
f
m*a	   �Һ?   �Һ?      �?!   �Һ?) �̊�{�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	    L��?    L��?      �?!    L��?)@0Z�5��?2_&A�o��?�Ca�G��?�������:              �?        

loss1�8>�T�       ��h�	�	
�I�A�*�
f
m*a	   ��Һ?   ��Һ?      �?!   ��Һ?) ��U
|�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   `E��?   `E��?      �?!   `E��?)@�|�%��?2_&A�o��?�Ca�G��?�������:              �?        

loss1�80��<�       ��h�	�
�I�A�*�
f
m*a	   �Ӻ?   �Ӻ?      �?!   �Ӻ?) b(&U|�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	    ?��?    ?��?      �?!    ?��?) x���?2_&A�o��?�Ca�G��?�������:              �?        

loss 1�8�7��       ��h�	
�I�A�*�
f
m*a	   �-Ӻ?   �-Ӻ?      �?!   �-Ӻ?) �;1�|�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	    9��?    9��?      �?!    9��?) KD��?2_&A�o��?�Ca�G��?�������:              �?        

loss 1�8�5|*�       ��h�	>&
�I�A�*�
f
m*a	   �UӺ?   �UӺ?      �?!   �UӺ?) t`A�|�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   @3��?   @3��?      �?!   @3��?) )����?2_&A�o��?�Ca�G��?�������:              �?        

loss 1�8r$]��       ��h�	�/
�I�A�*�
f
m*a	   �{Ӻ?   �{Ӻ?      �?!   �{Ӻ?) �y�}�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   �-��?   �-��?      �?!   �-��?)@���톶?2_&A�o��?�Ca�G��?�������:              �?        

loss�0�8O"Ei�       ��h�	�;
�I�A�*�
f
m*a	   ��Ӻ?   ��Ӻ?      �?!   ��Ӻ?)���[}�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   �(��?   �(��?      �?!   �(��?)@&hᆶ?2_&A�o��?�Ca�G��?�������:              �?        

loss�0�8j���       ��h�	sG
�I�A�*�
f
m*a	    �Ӻ?    �Ӻ?      �?!    �Ӻ?)  ���}�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   �#��?   �#��?      �?!   �#��?)@p`"ֆ�?2_&A�o��?�Ca�G��?�������:              �?        

loss�0�84p� �       ��h�	ca
�I�A�*�
f
m*a	    �Ӻ?    �Ӻ?      �?!    �Ӻ?) �Ch�}�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	    ��?    ��?      �?!    ��?)@���ʆ�?2_&A�o��?�Ca�G��?�������:              �?        

loss1�8n�2@�       ��h�	�n
�I�A�*�
f
m*a	   � Ժ?   � Ժ?      �?!   � Ժ?) ���}�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ���?   ���?      �?!   ���?)@$�����?2_&A�o��?�Ca�G��?�������:              �?        

loss�0�8f5�[�       ��h�	�x
�I�A�*�
f
m*a	   �Ժ?   �Ժ?      �?!   �Ժ?)��Kb.~�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ���?   ���?      �?!   ���?)@�ϰ���?2_&A�o��?�Ca�G��?�������:              �?        

loss�0�8����       ��h�	f�
�I�A�*�
f
m*a	   `9Ժ?   `9Ժ?      �?!   `9Ժ?) ߞ�\~�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ���?   ���?      �?!   ���?) ��~���?2_&A�o��?�Ca�G��?�������:              �?        

loss�0�8S����       ��h�	&�
�I�A�*�
f
m*a	   `SԺ?   `SԺ?      �?!   `SԺ?) ;�M�~�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	    ��?    ��?      �?!    ��?) �����?2_&A�o��?�Ca�G��?�������:              �?        

loss�0�8�V�       ��h�	З
�I�A�*�
f
m*a	    lԺ?    lԺ?      �?!    lԺ?) Xα~�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ���?   ���?      �?!   ���?) DHJ���?2_&A�o��?�Ca�G��?�������:              �?        

loss�0�8Ɛ��       ��h�	ܠ
�I�A�*�
f
m*a	   ��Ժ?   ��Ժ?      �?!   ��Ժ?) b| �~�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	    ��?    ��?      �?!    ��?)@ �G���?2_&A�o��?�Ca�G��?�������:              �?        

loss�0�8�Y&c�       ��h�	��
�I�A�*�
f
m*a	   ��Ժ?   ��Ժ?      �?!   ��Ժ?)��P�~�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ���?   ���?      �?!   ���?)@|�����?2_&A�o��?�Ca�G��?�������:              �?        

loss�0�8��n�       ��h�	��
�I�A�*�
f
m*a	    �Ժ?    �Ժ?      �?!    �Ժ?) }�!�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ���?   ���?      �?!   ���?)@8s���?2_&A�o��?�Ca�G��?�������:              �?        

loss�0�8�[a�       ��h�	w�
�I�A�*�
f
m*a	    �Ժ?    �Ժ?      �?!    �Ժ?) Hd|C�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	    ���?    ���?      �?!    ���?) ��~��?2_&A�o��?�Ca�G��?�������:              �?        

loss�0�8_"o��       ��h�	T�
�I�A�*�
f
m*a	    �Ժ?    �Ժ?      �?!    �Ժ?)  Yc�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   `���?   `���?      �?!   `���?)@��ex��?2_&A�o��?�Ca�G��?�������:              �?        

loss�0�8k����       ��h�	R�
�I�A�*�
f
m*a	   ��Ժ?   ��Ժ?      �?!   ��Ժ?) 0�R��?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ����?   ����?      �?!   ����?) q"+r��?2_&A�o��?�Ca�G��?�������:              �?        

loss�0�8J��       ��h�	��
�I�A�*�
f
m*a	   ��Ժ?   ��Ժ?      �?!   ��Ժ?) �'՝�?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   `���?   `���?      �?!   `���?)@�T�l��?2_&A�o��?�Ca�G��?�������:              �?        

loss�0�8��vu�       ��h�	K�
�I�A�*�
f
m*a	   �պ?   �պ?      �?!   �պ?) v(���?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	    ���?    ���?      �?!    ���?) ���f��?2_&A�o��?�Ca�G��?�������:              �?        

loss�0�8��	��       ��h�	��
�I�A�*�
f
m*a	   @պ?   @պ?      �?!   @պ?)�`�r��?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ����?   ����?      �?!   ����?)@Ě�a��?2_&A�o��?�Ca�G��?�������:              �?        

loss�0�8�م�       ��h�	��
�I�A�*�
f
m*a	   �&պ?   �&պ?      �?!   �&պ?) �`���?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ����?   ����?      �?!   ����?) ���\��?2_&A�o��?�Ca�G��?�������:              �?        

loss�0�8i��8�       ��h�	��I�A�*�
f
m*a	   �4պ?   �4պ?      �?!   �4պ?) ">���?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ����?   ����?      �?!   ����?)@T�\X��?2_&A�o��?�Ca�G��?�������:              �?        

loss�0�8Q?I�       ��h�	k�I�A�*�
f
m*a	   `Aպ?   `Aպ?      �?!   `Aպ?) ��j��?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ����?   ����?      �?!   ����?)@ܦ�S��?2_&A�o��?�Ca�G��?�������:              �?        

loss�0�8j1l�       ��h�	��I�A�*�
f
m*a	    Nպ?    Nպ?      �?!    Nպ?)  �,��?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   @���?   @���?      �?!   @���?) �z�O��?2_&A�o��?�Ca�G��?�������:              �?        

loss�0�8[^#�       ��h�	�!�I�A�*�
f
m*a	   �Yպ?   �Yպ?      �?!   �Yպ?) Rr�?��?2%g�cE9�?��(!�ؼ?�������:              �?        
f
b*a	   ����?   ����?      �?!   ����?) �_�K��?2_&A�o��?�Ca�G��?�������:              �?        

loss�0�8�Z��