import React from 'react'
import { View, TouchableOpacity, ScrollView, StyleSheet, requireNativeComponent, Image, Text } from 'react-native'

import Scene from 'AwesomeProject/app/scenes/Scene'
import Button from 'AwesomeProject/app/components/Button'

import SnapShot from 'react-native-snapshot-view'

console.log(" SnapShot : ", SnapShot);

export default class Communications extends React.Component {

  constructor(props) {
    super(props)

    this.state = {
      shootNum: 3,
      imagePath: "aaa",
      fileName: "aasa"
    }
  }

  render() {
    const { navigator } = this.props

    return (
      <Scene navigator={navigator} hideBack={true}
        style={{justifyContent: "center", alignItems: "center"}}>
        <ScrollView>
          <Button lable={"shoot"} onPress={() => {
            const shootNum = this.state.shootNum + 1
            this.setState({
              shootNum
            })
          }}/>

          <SnapShot
            fileName={this.state.fileName}
            shotNumber={this.state.shootNum}
            onShoted={events => {
              console.log(' onShoted : ', events.nativeEvent.filePath);
              this.setState({
                imagePath: events.nativeEvent.filePath
              })
            }}
            style={{width: 100, height: 300, backgroundColor: "blue", justifyContent: "center", alignItems: "center"}}>
            <View style={{width: 50, height: 50, backgroundColor: "red"}}></View>
            <Text style={{fontSize: 20, color: "#947589"}}>Snapshot GO HOOOH！！！</Text>
          </SnapShot>

          <Image
            style={{width: 500, height: 600}}
            source={{uri: this.state.imagePath, isStatic: true}}
            resizeMode={"contain"}/>
        </ScrollView>
      </Scene>
    )
  }
}








const styles = StyleSheet.create({
  btn: {
    width: 200,
    height: 54,
    backgroundColor: "#6F85AD"
  }
})
