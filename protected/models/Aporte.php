<?php

/**
 * This is the model class for table "Aporte".
 *
 * The followings are the available columns in table 'Aporte':
 * @property integer $idAporte
 * @property string $Nombre
 * @property string $Categoria
 * @property string $tipoDeAporte
 * @property integer $Puntuacion
 * @property string $Comentarios
 * @property integer $Tema_idTema
 * @property integer $Tema_Curso_idCurso
 *
 * The followings are the available model relations:
 * @property Tema $temaIdTema
 * @property Tema $temaCursoIdCurso
 */
class Aporte extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'Aporte';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('Tema_idTema, Tema_Curso_idCurso', 'required'),
			array('Puntuacion, Tema_idTema, Tema_Curso_idCurso', 'numerical', 'integerOnly'=>true),
			array('Nombre, Categoria, tipoDeAporte, Comentarios', 'length', 'max'=>45),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('idAporte, Nombre, Categoria, tipoDeAporte, Puntuacion, Comentarios, Tema_idTema, Tema_Curso_idCurso', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'temaIdTema' => array(self::BELONGS_TO, 'Tema', 'Tema_idTema'),
			'temaCursoIdCurso' => array(self::BELONGS_TO, 'Tema', 'Tema_Curso_idCurso'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'idAporte' => 'Id Aporte',
			'Nombre' => 'Nombre',
			'Categoria' => 'Categoria',
			'tipoDeAporte' => 'Tipo De Aporte',
			'Puntuacion' => 'Puntuacion',
			'Comentarios' => 'Comentarios',
			'Tema_idTema' => 'Tema Id Tema',
			'Tema_Curso_idCurso' => 'Tema Curso Id Curso',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('idAporte',$this->idAporte);
		$criteria->compare('Nombre',$this->Nombre,true);
		$criteria->compare('Categoria',$this->Categoria,true);
		$criteria->compare('tipoDeAporte',$this->tipoDeAporte,true);
		$criteria->compare('Puntuacion',$this->Puntuacion);
		$criteria->compare('Comentarios',$this->Comentarios,true);
		$criteria->compare('Tema_idTema',$this->Tema_idTema);
		$criteria->compare('Tema_Curso_idCurso',$this->Tema_Curso_idCurso);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Aporte the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
