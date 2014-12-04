<?php
/* @var $this TemaController */
/* @var $data Tema */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('idTema')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->idTema), array('view', 'id'=>$data->idTema)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('Nombre')); ?>:</b>
	<?php echo CHtml::encode($data->Nombre); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('NumeroDeAportes')); ?>:</b>
	<?php echo CHtml::encode($data->NumeroDeAportes); ?>
	<br />


</div>