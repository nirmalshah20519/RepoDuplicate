console.log("UNION");
console.log("");

function printer(id:number|string){
    console.log(typeof id);
    console.log("The id is "+id);
}

printer("Hello")
printer(26)
console.log("");

type T = {
    x: number|string;
    y: number;
  };
  function ptr(pt: T) {
    console.log("first value is " + pt.x);
    console.log("second value is " + pt.y);
  }
   
  ptr({ x: "100", y: 100 });


  function printSomeText(x: string | null) {
    if (x === null) {
      // do nothing
      console.log("paramater type is null");
    } else {
      console.log("paramater type is string");
      console.log("Hello, " + x.toUpperCase());
    }
  }

  printSomeText("myString")
  printSomeText(null)

  console.log("INTERSECTION");

  interface ErrorHandling {
    success: boolean;
    error?: { message: string };
  }
   
  interface ArtworksData {
    artworks: { title: string }[];
  }
   
  interface ArtistsData {
    artists: { name: string }[];
  }

   
  type ArtworksResponse = ArtworksData & ErrorHandling;
  type ArtistsResponse = ArtistsData & ErrorHandling;
   
  const handleArtistsResponse = (response: ArtistsResponse) => {
    if (response.success===false) {
      console.error(response.error!.message);
      return;
    }
   
    console.log(response.artists);
  }

  let res:ArtistsResponse={
    "success": false,
    "error": { "message": "I generated this error with intersection" },
    "artists": [{ "name": "Name1" },{ "name": "Name2" },{ "name": "Name3" }]
}

  handleArtistsResponse(res)
