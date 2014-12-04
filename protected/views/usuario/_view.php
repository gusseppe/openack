<?php
/* @var $this UsuarioController */
/* @var $data Usuario */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('idUsuario')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->idUsuario), array('view', 'id'=>$data->idUsuario)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('Nombre')); ?>:</b>
	<?php echo CHtml::encode($data->Nombre); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('Apellidos')); ?>:</b>
	<?php echo CHtml::encode($data->Apellidos); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('Puntuacion')); ?>:</b>
	<?php echo CHtml::encode($data->Puntuacion); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('NivelEducativo')); ?>:</b>
	<?php echo CHtml::encode($data->NivelEducativo); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('Carrera')); ?>:</b>
	<?php echo CHtml::encode($data->Carrera); ?>
	<br />


</div>