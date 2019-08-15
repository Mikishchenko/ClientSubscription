//
//  SampleData.swift
//  testClientSubscription
//
//  Created by Владимир Микищенко on 30/07/2019.
//  Copyright © 2019 Владимир Микищенко. All rights reserved.
//

import Foundation

protocol CSData {
    static func load() -> [ClientSubscription]?
}

struct SampleData: CSData {
    static func load() -> [ClientSubscription]? {
        return [
            ClientSubscription(serviceName: "#можноПочтиВСЁ", description: "Доступ в социальные сети через приложения ВКонтакте, Facebook, Instagram, Twitter и музыкальные сервисы ВКонтакте, Яндекс.Музыка, Яндекс.Радио, Zvooq.", price: 0),
            ClientSubscription(serviceName: "#можноВСЁ", description: "Доступ в социальные сети через приложения ВКонтакте, Facebook, Instagram, Twitter и музыкальные сервисы ВКонтакте, Яндекс.Музыка, Яндекс.Радио, Zvooq.", price: 1000),
            ClientSubscription(serviceName: "Есть контакт", description: "Ваш мобильный выключен или находится вне зоны действия сети, а кому-то нужно с Вами связаться", price: 200),
            ClientSubscription(serviceName: "Автопродление скорость 5ГБ", description: "Если интернета не хватило, ещё 5 ГБ подключатся автоматически", price: 0),
            ClientSubscription(serviceName: "Интернет-уведомление в роуминге", description: "Контролируйте свои расходы за мобильный интернет за границей. Если Ваши затраты превысили определённую сумму, мы отправим Вам SMS-уведомление", price: 0),
            ClientSubscription(serviceName: "Пакет 100 SMS в день", description: "Иногда удобнее написать, чем говорить. На такой случай – «Пакет 100 SMS в день» на все номера области подключения", price: 3),
            ClientSubscription(serviceName: "Пакет SMS", description: "500 SMS для общения дома и в поездках по России", price: 2),
            ClientSubscription(serviceName: "Добро пожаловать", description: "Выгодные цены на международные звонки", price: 0),
            ClientSubscription(serviceName: "Приз для эрудита", description: "Участвуйте в увлекательных призовых викторинах каждую неделю", price: 5),
            ClientSubscription(serviceName: "HD-видео", description: "Просмотр HD-видео на максимальной скорости", price: 3),
            ClientSubscription(serviceName: "Звонки без границ", description: "Безлимитные звонки на Украину на номера оператора Киевстар и в Кыргызстан на номера оператора Скайл Мобай", price: 6),
            ClientSubscription(serviceName: "Пакет 300 SMS", description: "Иногда удобнее написать, чем говорить. На такой случай – «Пакет 300 SMS» на все номера домашнего региона", price: 5),
            ClientSubscription(serviceName: "Смартфон для Всезнайки", description: "Викторина «Смартфон для Всезнайки» – розыгрыш 3 000 рублей каждый день, iPhone XR 256GB каждый месяц, а также розыгрыши по 1 000 000 (одному миллиону) рублей 31 июля 2019 и 31 января 2020 года.", price: 19),
            ClientSubscription(serviceName: "Будь в курсе +", description: "Будьте в курсе, кто вам звонил! Получайте голосовые сообщения, оставленные, пока вы были недоступны или не брали трубку.", price: 2),
        ]
    }
}
