

#Область ОписаниеПеременных

#КонецОбласти

#Область ОбработчикиСобытийФормы

// Код процедур и функций


&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Если Параметры.Свойство("Ссылка") Тогда
		Ссылка = Параметры.Ссылка;
	КонецЕсли;
	Если Параметры.Свойство("РежимВставки") Тогда
		РежимВставки = Параметры.РежимВставки;
	КонецЕсли;
	
	УстановитьВидимостьДоступность();
КонецПроцедуры


#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

// Код процедур и функций

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормы //<ИмяТаблицыФормы>

// Код процедур и функций

#КонецОбласти

#Область ОбработчикиКомандФормы


&НаКлиенте
Процедура СкопироватьВБуфер(Команда)
	УИ_БуферОбменаКлиент.НачатьКопированиеСтрокиВБуфер(Ссылка,
													   Новый ОписаниеОповещения("СкопироватьВБуферЗавершение",
		ЭтотОбъект));
КонецПроцедуры


&НаКлиенте
Процедура ПерейтиПоСсылке(Команда)
	УИ_ОбщегоНазначенияКлиент.ОткрытьНавигационнуюСсылку(Ссылка);
КонецПроцедуры

&НаКлиенте
Процедура ВставитьИзБуфераОбмена(Команда)
	УИ_БуферОбменаКлиент.НачатьПолучениеСтрокиИзБуфера(Новый ОписаниеОповещения("ВставитьИзБуфераОбменаЗавершение",
		ЭтотОбъект));

КонецПроцедуры

&НаКлиенте
Процедура Загрузить(Команда)
	Закрыть(Ссылка);
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// Скопировать в буфер завершение.
// 
// Параметры:
//  Результат - Булево-Результат
//  ПараметрыВызова - Произвольный -
//  ДополнительныеПараметры - Неопределено- Дополнительные параметры
&НаКлиенте
Процедура СкопироватьВБуферЗавершение(Результат,ПараметрыВызова, ДополнительныеПараметры) Экспорт
	Если Результат = Истина Тогда
		Заголовок = "Ссылка скопирована в буфер обмена";
	Иначе
		Заголовок = "Не удалось скопировать в буфер обмена";
	КонецЕсли;
КонецПроцедуры

// Вставить из буфера обмена завершение.
// 
// Параметры:
//  Результат - Строка -Результат
//  ДополнительныеПараметры -Неопределено-Дополнительные параметры
&НаКлиенте
Процедура ВставитьИзБуфераОбменаЗавершение(Результат, ДополнительныеПараметры) Экспорт
	Если Результат = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	Если Не ЗначениеЗаполнено(Результат) Тогда
		Возврат;
	КонецЕсли;
	
	Ссылка = Результат;
КонецПроцедуры

&НаСервере
Процедура УстановитьВидимостьДоступность()
	Если РежимВставки Тогда
		Элементы.СкопироватьВБуфер.Видимость = Ложь;
	Иначе
		Элементы.ВставитьИзБуфераОбмена.Видимость = Ложь;
		Элементы.ФормаЗагрузить.Видимость = Ложь;
		Элементы.ФормаЗакрыть.Видимость = Ложь;
	КонецЕсли;	
КонецПроцедуры

#КонецОбласти
