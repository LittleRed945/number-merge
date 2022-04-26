//
//  ContentView.swift
//  Shared
//
//  Created by  Erwin on 2022/4/18.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var game=game_varable()
    let player = AVPlayer()
    @AppStorage("Highest_Score") var highest: Int = 0
    var body: some View {
        //playing view
        ZStack{
            
        if(game.isplaying){
            
                VStack{
                    if(game.isover){
                        Text("Game Over").font(.title).foregroundColor(.white)
                            .onAppear {
                                if(highest<game.score){
                                    highest=game.score
                                }
                                            let fileUrl = Bundle.main.url(forResource: "lose", withExtension: "mp3")!
                                            let playerItem = AVPlayerItem(url: fileUrl)
                                            self.player.replaceCurrentItem(with: playerItem)
                                            self.player.play()
                                    }
                    }else{
                        Text("Number Merge").font(.title).foregroundColor(.white)
                            .onAppear {
                                            let fileUrl = Bundle.main.url(forResource: "battle", withExtension: "mp3")!
                                            let playerItem = AVPlayerItem(url: fileUrl)
                                            self.player.replaceCurrentItem(with: playerItem)
                                            self.player.play()
                                    }
                    }
                    
                    //home,score and volume
                    HStack{
                        //home
                        Button(action: {game.isplaying.toggle()}, label:{
                            Image(systemName:"house.circle.fill")
                                .resizable().frame(width: 25, height: 25)
                        })
                        //
                        //score
                        Text("Score:\(game.score)").foregroundColor(.white)
                        //
                        //volume
                        Button(action: {game.isplaymusic.toggle()
                            if(game.isplaymusic){
                                self.player.play()
                            }else{
                                self.player.pause()
                            }
                        }, label:{
                            if(game.isplaymusic){
                                Image(systemName:"speaker.wave.2.circle.fill").resizable().frame(width: 25, height: 25)
                                
                            }else{
                                Image(systemName:"speaker.slash.circle.fill").resizable().frame(width: 25, height: 25)
                            }
                            
                        })
                        //
                    }
                    //borad 5x5
                    VStack(spacing: 0.0){
                        ForEach(Range(0...4)){y in
                            HStack(spacing:0.0){
                                ForEach(Range(0...4)){x in
                                    if(game.isover == false){
                                        tileView(game: $game, x: x, y: y )
                                    }
                                    
                                    
                                    
                                }
                            }
                        }
                    }
                    //
                    ZStack{
                        if(game.isover){
                            VStack{
                                Text("Highest Score:\(highest)").foregroundColor(.white)
                                Button(action: {game.isover.toggle()
                                    game.play_again()
                                }, label:{
                                    Image(systemName:"goforward").resizable().frame(width: 25, height: 25)
                                })
                            }
                            
                        }else{
                            Rectangle()
                                    .stroke(Color.black)
                                .frame(width: 50, height: 50)
                            Image("\(game.next)")
                            Text("\(game.next)").offset(x:10,y:10).foregroundColor(.white)
                        }
                        
                    }
                    
                    
                
                
            }
            
        }
        //playing view end
        //home view
        else{
            VStack{
                Text("Number Merge").font(.title).foregroundColor(.white)
                //play button
                Button(action: {
                    game.reset()
                    game.isplaying.toggle()
                }, label:{
                    Image(systemName:"play.fill").resizable().frame(width: 25, height: 25)
                })
                //
            }
        }
        //home view end
           
        }.background( Image("Wordle_background").scaledToFill())
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct tileView: View {
    @Binding var game:game_varable
    let x:Int
    let y:Int
    var body: some View {
        ZStack{
            
            Button(action:{
                if(game.board[y][x].img_id == 0){
                    game.board[y][x]=tile()
                    game.board[y][x].img_id=game.next
                    game.next_random()
                    while(merge_check(x: x, y: y, game: game)){
                        number_merge(x: x, y: y, game: &game)
                        
                        game.board[y][x].img_id+=1
                        game.score+=1
                    }
                }
                if(isfull(game:game)){
                    game.isover=true
                }
            },label: {Rectangle()
                    .stroke(Color.black)
                .frame(width: 50, height: 50)}                                    ).alert("GameOver", isPresented: $game.isover,actions: {Button("OK"){}},message: {Text("Your Score:\(game.score)")})
            
            if(is_moved(x: x, y: y, game: game )){
                ZStack(alignment: .bottomTrailing){
                    if(game.board[y][x].img_id>8){
                        Image("8")
                    }else{
                        Image("\(game.board[y][x].img_id)")
                    }
                    
                    
                    Text("\(game.board[y][x].img_id)").offset(x:10,y:10).foregroundColor(.white)
                }.offset(game.board[y][x].offset)
                    .opacity(game.board[y][x].opacity)
                    .onAppear(){
                        game.board[y][x]=tile()
                    }
                
            }else if(game.board[y][x].img_id != 0){
                ZStack(alignment: .bottomTrailing){
                    Image("\(game.board[y][x].img_id)")
                    
                    Text("\(game.board[y][x].img_id)").offset(x:10,y:10)
                        .foregroundColor(.white)
                }
            }
            
            
        }
    }
}
