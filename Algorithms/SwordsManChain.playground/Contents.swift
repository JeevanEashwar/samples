//: Playground - noun: a place where people can play
class SwordsMan{
    var index:Int
    init(_ index:Int) {
        self.index = index
    }
    var nextSwordsMan:SwordsMan?
    func setNextSwordsMan(_ next:SwordsMan){
        nextSwordsMan = next
    }
}
class SwordsChain{
    var count:Int
    var firstMan:SwordsMan
    var lastMan:SwordsMan
    var isKillingCompleted:Bool
    init() {
        firstMan = SwordsMan(1)
        lastMan = firstMan
        count = 1
        isKillingCompleted = false
    }
    func addNextSwordsMan(_ index:Int){
        let newSwordsMan = SwordsMan(index)
        lastMan.setNextSwordsMan(newSwordsMan)
        lastMan = newSwordsMan
        count += 1
    }
    func completeTheCircle(){
        lastMan.setNextSwordsMan(firstMan)
    }
    func killNextSwordsMan(){
        if let dyingMan = firstMan.nextSwordsMan {
            if count>2 {
                firstMan.setNextSwordsMan(dyingMan.nextSwordsMan!)
                count -= 1
                let tempFirst = firstMan
                firstMan = tempFirst.nextSwordsMan!
                lastMan = tempFirst
            }else if(count == 2){
                //firstman will kill lastman and firstman is the only one left
                isKillingCompleted = true
            }
        }
    }
}
/*Start playing from here
    1.in the following 'for' loop change 100 to total number of swordsmen you want
 
 */

func testTheChain(totalMen:Int){
    let swordsChain1 = SwordsChain.init()
    for index in 2...totalMen{ // change totalMen to total number of swordsmen you want
        swordsChain1.addNextSwordsMan(index)
    }
    swordsChain1.completeTheCircle()
    //start killing
    while !swordsChain1.isKillingCompleted {
        swordsChain1.killNextSwordsMan()
    }
    print("Killing completed. Index \(swordsChain1.firstMan.index) is the only one left." )
}
testTheChain(totalMen: 100)
