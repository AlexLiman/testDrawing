//
//  ViewController.m
//  DrawingTest
//
//  Created by Alex on 26.04.16.
//  Copyright © 2016 Liman Inc. All rights reserved.
//
//Вот такой вот базовый урок получился. Эта тема - поле непаханое. Вы можете, если захотите, поискать кучу гайдов и примеров по этому материалу. Можно делать классные вещи. Но я не хочу на этом на долго останавливаться, нам нужно идти дальше :)
//
//Ученик.
//
//1. Нарисуйте пятиконечную звезду :)
//2. Добавьте окружности на концах звезды
//3. Соедините окружности линиями
//
//Студент.
//
//4. Закрасте звезду любым цветом цветом оО
//5. При каждой перерисовке рисуйте пять таких звезд (только мелких) в рандомных точках экрана
//
//Мастер
//
//6. После того как вы попрактиковались со звездами нарисуйте что-то свое, проявите творчество :)

#import "ViewController.h"
#import "ALDrawnStar.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet ALDrawnStar *drawRect;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.drawRect setNeedsDisplay];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
